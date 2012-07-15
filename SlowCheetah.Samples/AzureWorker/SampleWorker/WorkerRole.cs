using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.StorageClient;
using System.Configuration;
using System.Text;

namespace SampleWorker {
    public class WorkerRole : RoleEntryPoint {
        public override void Run() {
            // This is a sample worker implementation. Replace with your logic.
            Trace.WriteLine("SampleWorker entry point called", "Information");

            while (true) {
                Thread.Sleep(10000);
                Trace.WriteLine("Working", "Information");
            }
        }

        public override bool OnStart() {
            // Set the maximum number of concurrent connections 
            ServicePointManager.DefaultConnectionLimit = 12;

            DiagnosticMonitor.Start("DiagnosticsConnectionString");

            // For information on handling configuration changes
            // see the MSDN topic at http://go.microsoft.com/fwlink/?LinkId=166357.
            RoleEnvironment.Changing += RoleEnvironmentChanging;


            WriteOutAppSettingsToFile();

            return base.OnStart();
        }

        private void WriteOutAppSettingsToFile() {
            StringBuilder sb = new StringBuilder();
            foreach (var key in ConfigurationManager.AppSettings.AllKeys) {
                sb.AppendFormat("{0}:{1}{2}", key, ConfigurationManager.AppSettings[key], Environment.NewLine);
            }

            string file = @"C:\temp\publish\from-worker.txt";
            System.IO.File.WriteAllText(file,sb.ToString());
        }

        private void RoleEnvironmentChanging(object sender, RoleEnvironmentChangingEventArgs e) {
            // If a configuration setting is changing
            if (e.Changes.Any(change => change is RoleEnvironmentConfigurationSettingChange)) {
                // Set e.Cancel to true to restart this role instance
                e.Cancel = true;
            }
        }
    }
}
