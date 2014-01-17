namespace Tigerspike.PhoenixAnalytics.V1.Url
{
    using System.ComponentModel;

    using Tigerspike.Phoenix.Services.Url.Attributes;
    using Tigerspike.Phoenix.Services.Url.Services;

    /// <summary>
    /// Identity Service Rest endpoint URLs
    /// </summary>
    [ServiceEndPoint(Version1)]
    public class PhoenixAnalyticsServiceEndPoint : PhoenixServiceApi
    {
        #region "ActivateModule"

        public const string ActivateModule = "/projects/{projectid}";

        public const string ActivateModuleVerb = "POST";

        [Description("ActivateModule")]
        public ServiceEndpointInformation ActivateModuleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ActivateModule,
                Verb = ActivateModuleVerb
            };
        }

        #endregion

        #region "ActivityLog Endpoints"
        #region "ListActivityLog"
        public const string ListActivityLog = "/projects/{projectId}/transactions";

        public const string ListActivityLogVerb = "GET";

        [Description("ListActivityLog")]
        public ServiceEndpointInformation ListActivityLogInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListActivityLog,
                Verb = ListActivityLogVerb
            };
        }
        #endregion

        #region "CreateActivityLog"
        public const string CreateActivityLog = "/projects/{projectId}/transactions";

        public const string CreateActivityLogVerb = "POST";

        [Description("CreateActivityLog")]
        public ServiceEndpointInformation CreateActivityLogInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateActivityLog,
                Verb = CreateActivityLogVerb
            };
        }
        #endregion
        #endregion

        #region "EventLog Endpoints"

        #region "CreateEventLog"
        public const string CreateEventLog = "/projects/{projectId}/log";

        public const string CreateEventLogVerb = "POST";

        [Description("CreateEventLog")]
        public ServiceEndpointInformation CreateEventLogInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateEventLog,
                Verb = CreateEventLogVerb
            };
        }
        #endregion

        #region "ListEventLog"
        public const string ListEventLog = "/projects/{projectId}/log";

        public const string ListEventLogVerb = "GET";

        [Description("ListEventLog")]
        public ServiceEndpointInformation ListEventLogInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListEventLog,
                Verb = ListEventLogVerb
            };
        }
        #endregion

        #region "UpdateEventLog"
        public const string UpdateEventLog = "/projects/{projectId}/log";

        public const string UpdateEventLogVerb = "PUT";

        [Description("UpdateEventLog")]
        public ServiceEndpointInformation UpdateEventLogInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateEventLog,
                Verb = UpdateEventLogVerb
            };
        }
        #endregion

        #region "ListAggregateEventLog"
        public const string ListAggregateEventLog = "/projects/{projectId}/aggregateLog";

        public const string ListAggregateEventLogVerb = "GET";

        [Description("ListAggregateEventLog")]
        public ServiceEndpointInformation ListAggregateEventLogInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListAggregateEventLog,
                Verb = ListAggregateEventLogVerb
            };
        }
        #endregion

        #endregion

        #region "Activity Endpoints"

        #region "CreateActivity"
        public const string CreateActivity = "/projects/activity";

        public const string CreateActivityVerb = "POST";

        [Description("CreateActivity")]
        public ServiceEndpointInformation CreateActivityInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateActivityLog,
                Verb = CreateActivityVerb
            };
        }
        #endregion

        #region "ListActivity"

        public const string ListActivity = "/projects/{projectId}/activity";

        public const string ListActivityVerb = "GET";

        [Description("ListActivity")]
        public ServiceEndpointInformation ListActivityInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListActivity,
                Verb = ListActivityVerb
            };
        }
        #endregion

        #endregion

        #region "Triggers"
        public const string CreateTrigger = "/trigger";

        public const string CreateTriggerVerb = "POST";

        [Description("CreateTrigger")]
        public ServiceEndpointInformation CreateTriggerInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateTrigger,
                Verb = CreateTriggerVerb
            };
        }

        public const string ListTrigger = "/trigger";

        public const string ListTriggerVerb = "GET";

        [Description("ListTrigger")]
        public ServiceEndpointInformation ListTriggerInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListTrigger,
                Verb = ListTriggerVerb
            };
        }

        public const string GetTrigger = "/trigger/{id}";

        public const string GetTriggerVerb = "GET";

        [Description("GetTrigger")]
        public ServiceEndpointInformation GetTriggerInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetTrigger,
                Verb = GetTriggerVerb
            };
        }
        #endregion

        #region "Action"
        public const string ListAction = "/action";

        public const string ListActionVerb = "GET";

        [Description("ListAction")]
        public ServiceEndpointInformation ListActionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListAction,
                Verb = ListActionVerb
            };
        }
        #endregion

        #region "EventType"
        public const string ListEventType = "/events";

        public const string ListEventTypeVerb = "GET";

        [Description("ListEventType")]
        public ServiceEndpointInformation ListEventTypeInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListEventType,
                Verb = ListEventTypeVerb
            };
        }

        public const string CreateEventType = "/events";

        public const string CreateEventTypeVerb = "POST";

        [Description("CreateEventType")]
        public ServiceEndpointInformation CreateEventTypeInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateEventType,
                Verb = CreateEventTypeVerb
            };
        }
        #endregion
    }
}
