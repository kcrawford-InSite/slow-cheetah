<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureWorker1.7" generation="1" functional="0" release="0" Id="f47fa32a-677c-4a8d-b2de-a2dbed99c02f" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureWorker1.7Group" generation="1" functional="0" release="0">
      <settings>
        <aCS name="SampleWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/AzureWorker1.7/AzureWorker1.7Group/MapSampleWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="SampleWorkerInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureWorker1.7/AzureWorker1.7Group/MapSampleWorkerInstances" />
          </maps>
        </aCS>
      </settings>
      <maps>
        <map name="MapSampleWorker:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/AzureWorker1.7/AzureWorker1.7Group/SampleWorker/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapSampleWorkerInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureWorker1.7/AzureWorker1.7Group/SampleWorkerInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="SampleWorker" generation="1" functional="0" release="0" software="G:\Data\Development\My Code\slow-cheetah\SlowCheetah.Samples\AzureWorker\AzureWorker1.7\csx\Release\roles\SampleWorker" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="1792" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;SampleWorker&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;SampleWorker&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureWorker1.7/AzureWorker1.7Group/SampleWorkerInstances" />
            <sCSPolicyFaultDomainMoniker name="/AzureWorker1.7/AzureWorker1.7Group/SampleWorkerFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyFaultDomain name="SampleWorkerFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="SampleWorkerInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
</serviceModel>