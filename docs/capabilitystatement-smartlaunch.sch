<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile CapabilityStatement
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>CapabilityStatement</sch:title>
    <sch:rule context="f:CapabilityStatement">
      <sch:assert test="not(parent::f:contained and f:contained)">If the resource is contained in another resource, it SHALL NOT contain nested Resources (inherited)</sch:assert>
      <sch:assert test="not(parent::f:contained and f:text)">If the resource is contained in another resource, it SHALL NOT contain any narrative (inherited)</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated (inherited)</sch:assert>
      <sch:assert test="not(exists(for $id in f:contained/*/@id return $id[not(ancestor::f:contained/parent::*/descendant::f:reference/@value=concat('#', $id))]))">If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource (inherited)</sch:assert>
      <sch:assert test="count(f:rest)=count(distinct-values(f:rest/f:mode/@value))">There can only be one REST declaration per mode. (inherited)</sch:assert>
      <sch:assert test="count(f:document[f:mode/@value='producer'])=count(distinct-values(f:document[f:mode/@value='producer']/f:profile/f:reference/@value)) and count(f:document[f:mode/@value='consumer'])=count(distinct-values(f:document[f:mode/@value='consumer']/f:profile/f:reference/@value))">The set of documents must be unique by the combination of profile and mode. (inherited)</sch:assert>
      <sch:assert test="not(exists(f:implementation)) or (f:kind/@value != 'capability')">Capability Statements of kind 'instance' do not have implementation elements. (inherited)</sch:assert>
      <sch:assert test="not(exists(f:messaging/f:endpoint)) or f:kind/@value = 'instance'">Messaging end-point is required (and is only permitted) when a statement is for an implementation. (inherited)</sch:assert>
      <sch:assert test="not(exists(f:software) or exists(f:implementation)) or (f:kind/@value != 'requirements')">Capability Statements of kind 'requirements' do not have software or implementation elements. (inherited)</sch:assert>
      <sch:assert test="count(f:software | f:implementation | f:description) &gt; 0">A Capability Statement SHALL have at least one of description, software, or implementation element. (inherited)</sch:assert>
      <sch:assert test="exists(f:rest) or exists(f:messaging) or exists(f:document)">A Capability Statement SHALL have at least one of REST, messaging or document element. (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.software</sch:title>
    <sch:rule context="f:CapabilityStatement/f:software">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.implementation</sch:title>
    <sch:rule context="f:CapabilityStatement/f:implementation">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.rest</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="count(f:resource)=count(distinct-values(f:resource/f:type/@value))">A given resource can only be described once per RESTful mode. (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:CapabilityStatement/f:rest/f:security</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:security">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/smart-app-launch/StructureDefinition/extension-oauth-uris']) &gt;= 1">extension with URL = 'http://hl7.org/fhir/smart-app-launch/StructureDefinition/extension-oauth-uris': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/smart-app-launch/StructureDefinition/extension-oauth-uris']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/smart-app-launch/StructureDefinition/extension-oauth-uris': maximum cardinality of 'extension' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.rest.security</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:security">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.rest.security.extension</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:security/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both (inherited)</sch:assert>
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), 'value')])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.rest.security.certificate</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:security/f:certificate">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.rest.resource</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:resource">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="count(f:searchParam)=count(distinct-values(f:searchParam/f:name/@value))">Search parameter names must be unique in the context of a resource. (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.rest.resource.interaction</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:resource/f:interaction">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.rest.resource.searchParam</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:resource/f:searchParam">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.rest.interaction</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:interaction">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.rest.operation</sch:title>
    <sch:rule context="f:CapabilityStatement/f:rest/f:operation">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.messaging</sch:title>
    <sch:rule context="f:CapabilityStatement/f:messaging">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:supportedMessage) != exists(f:event)">A Capability Statement messaging element SHALL have either supportedMessage or event element, but not both. (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.messaging.endpoint</sch:title>
    <sch:rule context="f:CapabilityStatement/f:messaging/f:endpoint">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.messaging.supportedMessage</sch:title>
    <sch:rule context="f:CapabilityStatement/f:messaging/f:supportedMessage">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.messaging.event</sch:title>
    <sch:rule context="f:CapabilityStatement/f:messaging/f:event">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>CapabilityStatement.document</sch:title>
    <sch:rule context="f:CapabilityStatement/f:document">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
