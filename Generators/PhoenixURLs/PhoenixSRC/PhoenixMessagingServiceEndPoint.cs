namespace Tigerspike.PhoenixMessaging.V1.Url
{
    using System.ComponentModel;

    using Tigerspike.Phoenix.Services.Url.Attributes;
    using Tigerspike.Phoenix.Services.Url.Services;

    /// <summary>
    /// Identity Service Rest endpoint URLs
    /// </summary>
    [ServiceEndPoint(Version1)]
    public class PhoenixMessagingServiceEndPoint : PhoenixServiceApi
    {

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

        #region "UpdateModuleSettings"

        public const string UpdateModuleSettings = "/projects/{projectid}";

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

        public const string DeactivateModule = "/projects/{projectid}";

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

        #region "ListAccount"

        public const string ListAccount = "/projects/{projectid}/accounts?accountview={accountview}";

        public const string ListAccountVerb = "GET";

        [Description("ListAccount")]
        public ServiceEndpointInformation ListAccountInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListAccount,
                Verb = ListAccountVerb
            };
        }

        #endregion

        #region "GetAccount"

        public const string GetAccount = "/projects/{projectid}/accounts/{accountid}";

        public const string GetAccountVerb = "GET";

        [Description("GetAccount")]
        public ServiceEndpointInformation GetAccountInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetAccount,
                Verb = GetAccountVerb
            };
        }

        #endregion

        #region "CreateAccount"

        public const string CreateAccount = "/projects/{projectid}/accounts";

        public const string CreateAccountVerb = "POST";

        [Description("CreateAccount")]
        public ServiceEndpointInformation CreateAccountInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateAccount,
                Verb = CreateAccountVerb
            };
        }

        #endregion

        #region "UpdateAccount"

        public const string UpdateAccount = "/projects/{projectid}/accounts";

        public const string UpdateAccountVerb = "PUT";

        [Description("UpdateAccount")]
        public ServiceEndpointInformation UpdateAccountInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateAccount,
                Verb = UpdateAccountVerb
            };
        }

        #endregion

        #region "DeleteAccount"

        public const string DeleteAccount = "/projects/{projectid}/accounts/{accountid}";

        public const string DeleteAccountVerb = "DELETE";

        [Description("DeleteAccount")]
        public ServiceEndpointInformation DeleteAccountInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteAccount,
                Verb = DeleteAccountVerb
            };
        }

        #endregion

        #region "UploadAccountCertificate"

        public const string UploadAccountCertificate = "/projects/{projectid}/accounts/{accountid}/certificate";

        public const string UploadAccountCertificateVerb = "POST";

        [Description("UploadAccountCertificate")]
        public ServiceEndpointInformation UploadAccountCertificateInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UploadAccountCertificate,
                Verb = UploadAccountCertificateVerb
            };
        }

        #endregion

        #region "ListProjectAccountMap"

        public const string ListProjectAccountMap = "/projects/{projectid}/projectaccountmaps";

        public const string ListProjectAccountMapVerb = "GET";

        [Description("ListProjectAccountMap")]
        public ServiceEndpointInformation ListProjectAccountMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListProjectAccountMap,
                Verb = ListProjectAccountMapVerb
            };
        }

        #endregion

        #region "CreateProjectAccountMap"

        public const string CreateProjectAccountMap = "/projects/{projectid}/projectaccountmaps";

        public const string CreateProjectAccountMapVerb = "PUT";

        [Description("CreateProjectAccountMap")]
        public ServiceEndpointInformation CreateProjectAccountMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateProjectAccountMap,
                Verb = CreateProjectAccountMapVerb
            };
        }

        #endregion

        #region "UpdateProjectAccountMap"

        public const string UpdateProjectAccountMap = "/projects/{projectid}/projectaccountmaps";

        public const string UpdateProjectAccountMapVerb = "PUT";

        [Description("UpdateProjectAccountMap")]
        public ServiceEndpointInformation UpdateProjectAccountMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateProjectAccountMap,
                Verb = UpdateProjectAccountMapVerb
            };
        }

        #endregion

        #region "DeleteProjectAccountMap"

        public const string DeleteProjectAccountMap = "/projects/{projectid}/projectaccountmaps";

        public const string DeleteProjectAccountMapVerb = "GET";

        [Description("DeleteProjectAccountMap")]
        public ServiceEndpointInformation DeleteProjectAccountMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteProjectAccountMap,
                Verb = DeleteProjectAccountMapVerb
            };
        }

        #endregion

        #region "GetProjectAccountMap"

        public const string GetProjectAccountMap = "/projects/{projectid}/projectaccountmaps/{accountId}";

        public const string GetProjectAccountMapVerb = "GET";

        [Description("GetProjectAccountMap")]
        public ServiceEndpointInformation GetProjectAccountMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetProjectAccountMap,
                Verb = GetProjectAccountMapVerb
            };
        }

        #endregion

        #region "ListMessage"

        public const string ListMessage = "/projects/{projectid}/messages";

        public const string ListMessageVerb = "GET";

        [Description("ListMessage")]
        public ServiceEndpointInformation ListMessageInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListMessage,
                Verb = ListMessageVerb
            };
        }

        #endregion

        #region "GetMessage"

        public const string GetMessage = "/projects/{projectid}/messages/{id}";

        public const string GetMessageVerb = "GET";

        [Description("GetMessage")]
        public ServiceEndpointInformation GetMessageInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetMessage,
                Verb = GetMessageVerb
            };
        }


        #endregion

        #region "CreateMessage"

        public const string CreateMessage = "/projects/{projectid}/messages";

        public const string CreateMessageVerb = "POST";

        [Description("CreateMessage")]
        public ServiceEndpointInformation CreateMessageInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateMessage,
                Verb = CreateMessageVerb
            };
        }

        #endregion

        #region "SendMessage"

        public const string SendMessage = "/projects/{projectid}/messages/send";

        public const string SendMessageVerb = "POST";

        [Description("SendMessage")]
        public ServiceEndpointInformation SendMessageInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateMessage,
                Verb = CreateMessageVerb
            };
        }

        #endregion

        #region "DeleteMessage"

        public const string DeleteMessage = "/projects/{projectid}/messages/{id}";

        public const string DeleteMessageVerb = "DELETE";

        [Description("DeleteMessage")]
        public ServiceEndpointInformation DeleteMessageInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteMessage,
                Verb = DeleteMessageVerb
            };
        }


        #endregion

        #region "ListBroadcast"

        public const string ListBroadcast = "/projects/{projectid}/broadcasts";

        public const string ListBroadcastVerb = "GET";

        [Description("ListBroadcast")]
        public ServiceEndpointInformation ListBroadcastInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListBroadcast,
                Verb = ListBroadcastVerb
            };
        }

        #endregion

        #region "GetAccount"

        public const string GetBroadcast = "/projects/{projectid}/Broadcasts/{id}";

        public const string GetBroadcastVerb = "GET";

        [Description("GetBroadcast")]
        public ServiceEndpointInformation GetBroadcastInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetBroadcast,
                Verb = GetBroadcastVerb
            };
        }

        #endregion

        #region "CreateBroadcast"

        public const string CreateBroadcast = "/projects/{projectid}/Broadcasts";

        public const string CreateBroadcastVerb = "POST";

        [Description("CreateBroadcast")]
        public ServiceEndpointInformation CreateBroadcastInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateBroadcast,
                Verb = CreateBroadcastVerb
            };
        }

        #endregion

        #region "UpdateBroadcast"

        public const string UpdateBroadcast = "/projects/{projectid}/Broadcasts";

        public const string UpdateBroadcastVerb = "PUT";

        [Description("UpdateBroadcast")]
        public ServiceEndpointInformation UpdateBroadcastInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateBroadcast,
                Verb = UpdateBroadcastVerb
            };
        }

        #endregion

        #region "DeleteBroadcast"

        public const string DeleteBroadcast = "/projects/{projectid}/Broadcasts/{id}";

        public const string DeleteBroadcastVerb = "DELETE";

        [Description("DeleteBroadcast")]
        public ServiceEndpointInformation DeleteBroadcastInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteBroadcast,
                Verb = DeleteBroadcastVerb
            };
        }

        #endregion

        #region "DequeueBroadcast"

        public const string DequeueBroadcast = "";

        public const string DequeueBroadcastVerb = "DELETE";

        [Description("DequeueBroadcast")]
        public ServiceEndpointInformation DequeueBroadcastInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DequeueBroadcast,
                Verb = DequeueBroadcastVerb
            };
        }

        #endregion

        #region "ListRecipient"

        public const string ListRecipient = "/projects/{projectid}/messages/{messageid}/recipients";

        public const string ListRecipientVerb = "GET";

        [Description("ListRecipient")]
        public ServiceEndpointInformation ListRecipientInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListAccount,
                Verb = ListAccountVerb
            };
        }

        #endregion

        #region "CreateRecipient"

        public const string CreateRecipient = "/projects/{projectid}/messages/{messageid}/recipients";

        public const string CreateRecipientVerb = "POST";

        [Description("CreateRecipient")]
        public ServiceEndpointInformation CreateRecipientInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateRecipient,
                Verb = CreateRecipientVerb
            };
        }

        #endregion

        #region "UpdateRecipient"

        public const string UpdateRecipient = "/projects/{projectid}/messages/{messageid}/recipients";

        public const string UpdateRecipientVerb = "PUT";

        [Description("UpdateRecipient")]
        public ServiceEndpointInformation UpdateRecipientInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateRecipient,
                Verb = UpdateRecipientVerb
            };
        }

        #endregion

        #region "ListTemplate"

        public const string ListTemplate = "/projects/{projectid}/templates";

        public const string ListTemplateVerb = "GET";

        [Description("ListTemplate")]
        public ServiceEndpointInformation ListTemplateInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListTemplate,
                Verb = ListTemplateVerb
            };
        }

        #endregion

        #region "GetTemplate"

        public const string GetTemplate = "/projects/{projectid}/templates/{id}";

        public const string GetTemplateVerb = "GET";

        [Description("GetTemplate")]
        public ServiceEndpointInformation GetTemplateInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetTemplate,
                Verb = GetTemplateVerb
            };
        }

        #endregion

        #region "CreateTemplate"

        public const string CreateTemplate = "/projects/{projectid}/templates";

        public const string CreateTemplateVerb = "POST";

        [Description("CreateTemplate")]
        public ServiceEndpointInformation CreateTemplateInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateTemplate,
                Verb = CreateTemplateVerb
            };
        }

        #endregion

        #region "UpdateTemplate"

        public const string UpdateTemplate = "/projects/{projectid}/templates";

        public const string UpdateTemplateVerb = "PUT";

        [Description("UpdateTemplate")]
        public ServiceEndpointInformation UpdateTemplateInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateTemplate,
                Verb = UpdateTemplateVerb
            };
        }

        #endregion

        #region "DeleteTemplate"

        public const string DeleteTemplate = "/projects/{projectid}/templates/{id}";

        public const string DeleteTemplateVerb = "DELETE";

        [Description("DeleteTemplate")]
        public ServiceEndpointInformation DeleteTemplateInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteTemplate,
                Verb = DeleteTemplateVerb
            };
        }

        #endregion

        #region "TemplateGroup Endpoints"

        #region "ListTemplateGroup"

        public const string ListTemplateGroup = "/projects/{projectid}/templategroups";

        public const string ListTemplateGroupVerb = "GET";

        [Description("ListTemplateGroup")]
        public ServiceEndpointInformation ListTemplateGroupInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListTemplateGroup,
                Verb = ListTemplateGroupVerb
            };
        }

        #endregion

        #region "GetTemplateGroup"

        public const string GetTemplateGroup = "/projects/{projectid}/templategroups/{id}";

        public const string GetTemplateGroupVerb = "GET";

        [Description("GetTemplateGroup")]
        public ServiceEndpointInformation GetTemplateGroupInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetTemplateGroup,
                Verb = GetTemplateGroupVerb
            };
        }

        #endregion

        #region "CreateTemplateGroup"

        public const string CreateTemplateGroup = "/projects/{projectid}/templategroups";

        public const string CreateTemplateGroupVerb = "POST";

        [Description("CreateTemplateGroup")]
        public ServiceEndpointInformation CreateTemplateGroupInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateTemplateGroup,
                Verb = CreateTemplateGroupVerb
            };
        }

        #endregion

        #region "UpdateTemplateGroup"

        public const string UpdateTemplateGroup = "/projects/{projectid}/templategroups";

        public const string UpdateTemplateGroupVerb = "PUT";

        [Description("UpdateTemplateGroup")]
        public ServiceEndpointInformation UpdateTemplateGroupInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateTemplateGroup,
                Verb = UpdateTemplateGroupVerb
            };
        }

        #endregion

        #region "DeleteTemplateGroup"

        public const string DeleteTemplateGroup = "/projects/{projectid}/templategroups/{id}";

        public const string DeleteTemplateGroupVerb = "DELETE";

        [Description("DeleteTemplateGroup")]
        public ServiceEndpointInformation DeleteTemplateGroupInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteTemplateGroup,
                Verb = DeleteTemplateGroupVerb
            };
        }

        #endregion

        #endregion



    }
}
