namespace Tigerspike.PhoenixDataCapture.V1.Url
{
    using System.ComponentModel;

    using Tigerspike.Phoenix.Services.Url.Attributes;
    using Tigerspike.Phoenix.Services.Url.Services;

    /// <summary>
    /// Identity Service Rest endpoint URLs
    /// </summary>
    [ServiceEndPoint(Version1)]
    public class PhoenixDataCaptureServiceEndPoint : PhoenixServiceApi
    {
        #region Entry

        #region "ListEntry"

        public const string ListEntry = "/projects/{projectid}/entrysets/{entrysetid}/entries";
        public const string ListEntryVerb = "GET";

        [Description("ListEntry")]
        public ServiceEndpointInformation ListEntryInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListEntry,
                Verb = ListEntryVerb
            };
        }

        #endregion

        #region "GetEntry"

        public const string GetEntry = "/projects/{projectid}/entrysets/{entrysetid}/entries/{id}";
        public const string GetEntryVerb = "GET";

        [Description("GetEntry")]
        public ServiceEndpointInformation GetEntryInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetEntry,
                Verb = GetEntryVerb
            };
        }

        #endregion

        #region "CreateEntry"

        public const string CreateEntry = "/projects/{projectid}/entrysets/{entrysetid}/entries";
        public const string CreateEntryVerb = "POST";

        [Description("CreateEntry")]
        public ServiceEndpointInformation CreateEntryInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateEntry,
                Verb = CreateEntryVerb
            };
        }

        #endregion

        #region "UpdateEntry"

        public const string UpdateEntry = "/projects/{projectid}/entrysets/{entrysetid}/entries";
        public const string UpdateEntryVerb = "PUT";

        [Description("UpdateEntry")]
        public ServiceEndpointInformation UpdateEntryInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateEntry,
                Verb = UpdateEntryVerb
            };
        }

        #endregion

        #region "DeleteEntry"

        public const string DeleteEntry = "/projects/{projectid}/entrysets/{entrysetid}/entries/{id}";
        public const string DeleteEntryVerb = "DELETE";

        [Description("DeleteEntry")]
        public ServiceEndpointInformation DeleteEntryInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteEntry,
                Verb = DeleteEntryVerb
            };
        }

        #endregion

        #endregion

        #region EntryFile

        #region "ListEntryFile"

        public const string ListEntryFile = "/projects/{projectid}/params/{paramId}/entryfiles";
        public const string ListEntryFileVerb = "GET";

        [Description("ListEntryFile")]
        public ServiceEndpointInformation ListEntryFileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListEntryFile,
                Verb = ListEntryFileVerb
            };
        }

        #endregion

        #region "GetEntryFile"

        public const string GetEntryFile = "/projects/{projectid}/params/{paramId}/entryfiles/{id}";
        public const string GetEntryFileVerb = "GET";

        [Description("GetEntryFile")]
        public ServiceEndpointInformation GetEntryFileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetEntryFile,
                Verb = GetEntryFileVerb
            };
        }

        #endregion

        #region "DeleteEntryFile"

        public const string DeleteEntryFile = "/projects/{projectid}/params/{paramId}/entryfiles/{id}";
        public const string DeleteEntryFileVerb = "DELETE";

        [Description("DeleteEntryFile")]
        public ServiceEndpointInformation DeleteEntryFileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteEntryFile,
                Verb = DeleteEntryFileVerb
            };
        }

        #endregion

        #region "UploadEntryFile"

        public const string UploadEntryFile = "/projects/{projectId}/params/{param}/entryfiles?fileName={fileName}&mimeType={mimetype}";
        public const string UploadEntryFileVerb = "POST";

        [Description("UploadEntryFile")]
        public ServiceEndpointInformation UploadEntryFileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UploadEntryFile,
                Verb = UploadEntryFileVerb
            };
        }

        #endregion

        #endregion

        #region EntrySet

        #region "ListEntrySet"

        public const string ListEntrySet = "/projects/{projectid}/entrysets";
        public const string ListEntrySetVerb = "GET";

        [Description("ListEntrySet")]
        public ServiceEndpointInformation ListEntrySetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListEntrySet,
                Verb = ListEntrySetVerb
            };
        }

        #endregion

        #region "GetEntrySet"

        public const string GetEntrySet = "/projects/{projectid}/entrysets/{id}";
        public const string GetEntrySetVerb = "GET";

        [Description("GetEntrySet")]
        public ServiceEndpointInformation GetEntrySetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetEntrySet,
                Verb = GetEntrySetVerb
            };
        }

        #endregion

        #region "CreateEntrySet"

        public const string CreateEntrySet = "/projects/{projectid}/entrysets";
        public const string CreateEntrySetVerb = "POST";

        [Description("CreateEntrySet")]
        public ServiceEndpointInformation CreateEntrySetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateEntrySet,
                Verb = CreateEntrySetVerb
            };
        }

        #endregion

        #region "UpdateEntrySet"

        public const string UpdateEntrySet = "/projects/{projectid}/entrysets";
        public const string UpdateEntrySetVerb = "PUT";

        [Description("UpdateEntrySet")]
        public ServiceEndpointInformation UpdateEntrySetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateEntrySet,
                Verb = UpdateEntrySetVerb
            };
        }

        #endregion

        #region "DeleteEntrySet"

        public const string DeleteEntrySet = "/projects/{projectid}/entrysets/{id}";
        public const string DeleteEntrySetVerb = "DELETE";

        [Description("DeleteEntrySet")]
        public ServiceEndpointInformation DeleteEntrySetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteEntrySet,
                Verb = DeleteEntrySetVerb
            };
        }

        #endregion
        
        #endregion

        #region Param

        #region "ListParam"

        public const string ListParam = "/projects/{projectid}/entrysets/{entrysetid}/params";
        public const string ListParamVerb = "GET";

        [Description("ListParam")]
        public ServiceEndpointInformation ListParamInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListParam,
                Verb = ListParamVerb
            };
        }

        #endregion

        #region "GetParam"

        public const string GetParam = "/projects/{projectid}/entrysets/{entrysetid}/params/{id}";
        public const string GetParamVerb = "GET";

        [Description("GetParam")]
        public ServiceEndpointInformation GetParamInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetParam,
                Verb = GetParamVerb
            };
        }

        #endregion

        #region "CreateParam"

        public const string CreateParam = "/projects/{projectid}/entrysets/{entrysetid}/params";
        public const string CreateParamVerb = "POST";

        [Description("CreateParam")]
        public ServiceEndpointInformation CreateParamInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateParam,
                Verb = CreateParamVerb
            };
        }

        #endregion

        #region "UpdateParam"

        public const string UpdateParam = "/projects/{projectid}/entrysets/{entrysetid}/params";
        public const string UpdateParamVerb = "PUT";

        [Description("UpdateParam")]
        public ServiceEndpointInformation UpdateParamInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateParam,
                Verb = UpdateParamVerb
            };
        }

        #endregion

        #region "DeleteParam"

        public const string DeleteParam = "/projects/{projectid}/entrysets/{entrysetid}/params/{id}";
        public const string DeleteParamVerb = "DELETE";

        [Description("DeleteParam")]
        public ServiceEndpointInformation DeleteParamInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteParam,
                Verb = DeleteParamVerb
            };
        }

        #endregion

        #endregion

        #region Project

        #region "GetModuleSettings"

        public const string GetModuleSettings = "/projects/{projectId}";
        public const string GetModuleSettingsVerb = "GET";

        [Description("GetModuleSettings")]
        public ServiceEndpointInformation GetModuleSettingsInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetModuleSettings,
                Verb = GetModuleSettingsVerb
            };
        }

        #endregion

        #region "ActivateModule"

        public const string ActivateModule = "/projects/{projectId}";
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

        #region "UpdateModuleSettings"

        public const string UpdateModuleSettings = "/projects/{projectId}";
        public const string UpdateModuleSettingsVerb = "PUT";

        [Description("UpdateModuleSettings")]
        public ServiceEndpointInformation UpdateModuleSettingsInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateModuleSettings,
                Verb = UpdateModuleSettingsVerb
            };
        }

        #endregion

        #region "DeactivateModule"

        public const string DeactivateModule = "/projects/{projectId}";
        public const string DeactivateModuleVerb = "DELETE";

        [Description("DeactivateModule")]
        public ServiceEndpointInformation DeactivateModuleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeactivateModule,
                Verb = DeactivateModuleVerb
            };
        }

        #endregion

        #endregion

        #region Report

        #region "ListReport"

        public const string ListReport = "/projects/{projectid}/entrysets/{entrysetid}/reports";
        public const string ListReportVerb = "GET";

        [Description("ListReport")]
        public ServiceEndpointInformation ListReportInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListReport,
                Verb = ListReportVerb
            };
        }

        #endregion

        #region "GetReport"

        public const string GetReport = "/projects/{projectid}/entrysets/{entrysetid}/reports/{id}";
        public const string GetReportVerb = "GET";

        [Description("GetReport")]
        public ServiceEndpointInformation GetReportInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetReport,
                Verb = GetReportVerb
            };
        }

        #endregion

        #region "CreateReport"

        public const string CreateReport = "/projects/{projectid}/entrysets/{entrysetid}/reports";
        public const string CreateReportVerb = "POST";

        [Description("CreateReport")]
        public ServiceEndpointInformation CreateReportInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateReport,
                Verb = CreateReportVerb
            };
        }

        #endregion

        #region "UpdateReport"

        public const string UpdateReport = "/projects/{projectid}/entrysets/{entrysetid}/reports";
        public const string UpdateReportVerb = "PUT";

        [Description("UpdateReport")]
        public ServiceEndpointInformation UpdateReportInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateReport,
                Verb = UpdateReportVerb
            };
        }

        #endregion

        #region "DeleteReport"

        public const string DeleteReport = "/projects/{projectid}/entrysets/{entrysetid}/reports/{id}";
        public const string DeleteReportVerb = "DELETE";

        [Description("DeleteReport")]
        public ServiceEndpointInformation DeleteReportInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteReport,
                Verb = DeleteReportVerb
            };
        }

        #endregion

        #endregion
    }
}
