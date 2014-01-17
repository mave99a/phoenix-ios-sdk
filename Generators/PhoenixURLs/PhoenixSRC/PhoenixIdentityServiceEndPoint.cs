namespace Tigerspike.PhoenixIdentity.V1.Url
{
    using System.ComponentModel;

    using Tigerspike.Phoenix.Services.Url.Attributes;
    using Tigerspike.Phoenix.Services.Url.Services;

    /// <summary>
    /// Identity Service Rest endpoint URLs
    /// </summary>
    [ServiceEndPoint(Version1)]
    public class PhoenixIdentityServiceEndPoint : PhoenixServiceApi
    {
        #region "GrantToken"

        public const string GrantToken = "/token";

            public const string GrantTokenVerb = "POST";

            [Description("GrantToken")]
            public ServiceEndpointInformation GrantTokenInformation()
            {
                return new ServiceEndpointInformation()
                           {
                               Endpoint = GrantToken,
                               Verb = GrantTokenVerb
                           };
            }

        #endregion

        #region "Validate"

            public const string Validate = "/validate";

            public const string ValidateVerb = "GET";

            [Description("Validate")]
            public ServiceEndpointInformation ValidateInformation()
            {
                return new ServiceEndpointInformation()
                {
                    Endpoint = Validate,
                    Verb = ValidateVerb
                };
            }

        #endregion
    }   
}
