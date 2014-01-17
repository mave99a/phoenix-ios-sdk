namespace Tigerspike.PhoenixCommerce.V1.Url
{
    using System.ComponentModel;

    using Tigerspike.Phoenix.Services.Url.Attributes;
    using Tigerspike.Phoenix.Services.Url.Services;

    /// <summary>
    /// Identity Service Rest endpoint URLs
    /// </summary>
    [ServiceEndPoint(Version1)]
    public class PhoenixCommerceServiceEndPoint : PhoenixServiceApi
    {
        #region Transaction

        #region "ListTransaction"

        public const string ListTransaction = "/projects/{projectId}/transactions";

        public const string ListTransactionVerb = "GET";

        [Description("ListTransaction")]
        public ServiceEndpointInformation ListTransactionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListTransaction,
                Verb = ListTransactionVerb
            };
        }

        #endregion

        #region "CreateTransaction"

        public const string CreateTransaction = "/projects/{projectId}/transactions";

        public const string CreateTransactionVerb = "POST";

        [Description("CreateTransaction")]
        public ServiceEndpointInformation CreateTransactionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateTransaction,
                Verb = CreateTransactionVerb
            };
        }

        #endregion

        #endregion

        #region Project

        #region ActivateModule

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

        #endregion
    }   
}
