using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Diagnostics;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage.Queue;
using System.Net.Http;
using Newtonsoft.Json.Linq;

namespace NewsReader
{
    public class WorkerRole : RoleEntryPoint
    {
       private CloudQueue newsQueue;
        int offset = 0;
        private static string NewsSearchEndPoint = "https://api.cognitive.microsoft.com/bing/v5.0/news";
        private static HttpClient searchClient { get; set; }
        const string bingKey = "e2d98303b197405182abdddde842cbf4";

        public override void Run()
        {
            Trace.TraceInformation("NewsReader is running");
            searchClient = new HttpClient();
            searchClient.DefaultRequestHeaders.Add("Ocp-Apim-Subscription-Key", bingKey);
            Task< IEnumerable<NewsArticle>> newsArticles = GetNewsSearchResults(20, offset);
           
        }

       

        public override bool OnStart()
        {
            // Set the maximum number of concurrent connections
            ServicePointManager.DefaultConnectionLimit = 12;

            // For information on handling configuration changes
            // see the MSDN topic at http://go.microsoft.com/fwlink/?LinkId=166357.

            bool result = base.OnStart();

            Trace.TraceInformation("NewsReader has been started");

            return result;
        }

        public override void OnStop()
        {
            Trace.TraceInformation("NewsReader is stopping");

      

            base.OnStop();

            Trace.TraceInformation("NewsReader has stopped");
        }

        private async Task RunAsync(CancellationToken cancellationToken)
        {
            // TODO: Replace the following with your own logic.
            while (!cancellationToken.IsCancellationRequested)
            {
                Trace.TraceInformation("Working");
                await Task.Delay(1000);
            }
        }

         public static async Task<IEnumerable<NewsArticle>> GetNewsSearchResults( int count = 20, int offset = 0)

        {

            List<NewsArticle> articles = new List<NewsArticle>();



            var result = await searchClient.GetAsync(string.Format("{0}?count={1}&offset={2}", NewsSearchEndPoint, count, offset));


            var json = result.Content.ReadAsStringAsync().Result;

            dynamic data = JObject.Parse(json);



            if (data.value != null && data.value.Count > 0)

            {

                for (int i = 0; i < data.value.Count; i++)

                {

                    articles.Add(new NewsArticle

                    {

                        Title = data.value[i].name,

                        Url = data.value[i].url,

                        Description = data.value[i].description,

                        ThumbnailUrl = data.value[i].image.thumbnail.contentUrl,

                        Provider = data.value[i].provider[0].name

                    });

                }

            }

            return articles;

        }

        public class NewsArticle
        {


            public string Title { get; set; }

            public string Description { get; set; }

            public string Url { get; set; }

            public string ThumbnailUrl { get; set; }

            public string Provider { get; set; }
        }
    }
}
