<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="NewsFeed" generation="1" functional="0" release="0" Id="33f4dc73-d95f-425b-9434-d00f3bd1a81b" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="NewsFeedGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="WebUser:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/NewsFeed/NewsFeedGroup/LB:WebUser:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="NewsPublisher:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/NewsFeed/NewsFeedGroup/MapNewsPublisher:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="NewsPublisherInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/NewsFeed/NewsFeedGroup/MapNewsPublisherInstances" />
          </maps>
        </aCS>
        <aCS name="NewsReader:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/NewsFeed/NewsFeedGroup/MapNewsReader:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="NewsReaderInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/NewsFeed/NewsFeedGroup/MapNewsReaderInstances" />
          </maps>
        </aCS>
        <aCS name="WebUser:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/NewsFeed/NewsFeedGroup/MapWebUser:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="WebUserInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/NewsFeed/NewsFeedGroup/MapWebUserInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:WebUser:Endpoint1">
          <toPorts>
            <inPortMoniker name="/NewsFeed/NewsFeedGroup/WebUser/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapNewsPublisher:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/NewsFeed/NewsFeedGroup/NewsPublisher/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapNewsPublisherInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/NewsFeed/NewsFeedGroup/NewsPublisherInstances" />
          </setting>
        </map>
        <map name="MapNewsReader:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/NewsFeed/NewsFeedGroup/NewsReader/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapNewsReaderInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/NewsFeed/NewsFeedGroup/NewsReaderInstances" />
          </setting>
        </map>
        <map name="MapWebUser:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/NewsFeed/NewsFeedGroup/WebUser/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapWebUserInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/NewsFeed/NewsFeedGroup/WebUserInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="NewsPublisher" generation="1" functional="0" release="0" software="c:\users\vargupta\documents\visual studio 2013\Projects\NewsFeed\NewsFeed\csx\Debug\roles\NewsPublisher" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;NewsPublisher&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;NewsPublisher&quot; /&gt;&lt;r name=&quot;NewsReader&quot; /&gt;&lt;r name=&quot;WebUser&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/NewsFeed/NewsFeedGroup/NewsPublisherInstances" />
            <sCSPolicyUpdateDomainMoniker name="/NewsFeed/NewsFeedGroup/NewsPublisherUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/NewsFeed/NewsFeedGroup/NewsPublisherFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="NewsReader" generation="1" functional="0" release="0" software="c:\users\vargupta\documents\visual studio 2013\Projects\NewsFeed\NewsFeed\csx\Debug\roles\NewsReader" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;NewsReader&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;NewsPublisher&quot; /&gt;&lt;r name=&quot;NewsReader&quot; /&gt;&lt;r name=&quot;WebUser&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/NewsFeed/NewsFeedGroup/NewsReaderInstances" />
            <sCSPolicyUpdateDomainMoniker name="/NewsFeed/NewsFeedGroup/NewsReaderUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/NewsFeed/NewsFeedGroup/NewsReaderFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="WebUser" generation="1" functional="0" release="0" software="c:\users\vargupta\documents\visual studio 2013\Projects\NewsFeed\NewsFeed\csx\Debug\roles\WebUser" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WebUser&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;NewsPublisher&quot; /&gt;&lt;r name=&quot;NewsReader&quot; /&gt;&lt;r name=&quot;WebUser&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/NewsFeed/NewsFeedGroup/WebUserInstances" />
            <sCSPolicyUpdateDomainMoniker name="/NewsFeed/NewsFeedGroup/WebUserUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/NewsFeed/NewsFeedGroup/WebUserFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="WebUserUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="NewsPublisherUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="NewsReaderUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="NewsPublisherFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="NewsReaderFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="WebUserFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="NewsPublisherInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="NewsReaderInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="WebUserInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="cc859a78-c116-454e-95e8-bd0135759e65" ref="Microsoft.RedDog.Contract\ServiceContract\NewsFeedContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="9ca570e9-465a-4a13-89b2-a3b00ce67331" ref="Microsoft.RedDog.Contract\Interface\WebUser:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/NewsFeed/NewsFeedGroup/WebUser:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>