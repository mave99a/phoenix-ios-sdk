namespace Tigerspike.PhoenixSyndicate.V1.Url
{
    using System.ComponentModel;

    using Tigerspike.Phoenix.Services.Url.Attributes;
    using Tigerspike.Phoenix.Services.Url.Services;

    /// <summary>
    /// Identity Service Rest endpoint URLs
    /// </summary>
    [ServiceEndPoint(Version1)]
    public class PhoenixSyndicateServiceEndPoint : PhoenixServiceApi
    {
        #region Section

        #region "ListSection"

        public const string ListSection = "/projects/{projectid}/sections";
        public const string ListSectionVerb = "GET";

        [Description("ListSection")]
        public ServiceEndpointInformation ListSectionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListSection,
                Verb = ListSectionVerb
            };
        }

        #endregion

        #region "GetSection"

        public const string GetSection = "/projects/{projectid}/sections/{id}";
        public const string GetSectionVerb = "GET";

        [Description("GetSection")]
        public ServiceEndpointInformation GetSectionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetSection,
                Verb = GetSectionVerb
            };
        }

        #endregion

        #region "CreateSection"

        public const string CreateSection = "/projects/{projectid}/sections";
        public const string CreateSectionVerb = "POST";

        [Description("CreateSection")]
        public ServiceEndpointInformation CreateSectionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateSection,
                Verb = CreateSectionVerb
            };
        }

        #endregion

        #region "UpdateSection"

        public const string UpdateSection = "/projects/{projectid}/sections";
        public const string UpdateSectionVerb = "PUT";

        [Description("UpdateSection")]
        public ServiceEndpointInformation UpdateSectionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateSection,
                Verb = UpdateSectionVerb
            };
        }

        #endregion

        #region "DeleteSection"

        public const string DeleteSection = "/projects/{projectid}/sections/{id}";
        public const string DeleteSectionVerb = "DELETE";

        [Description("DeleteSection")]
        public ServiceEndpointInformation DeleteSectionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteSection,
                Verb = DeleteSectionVerb
            };
        }

        #endregion

        #endregion

        #region Edition

        #region "ListEdition"

        public const string ListEdition = "/projects/{projectid}/editions";
        public const string ListEditionVerb = "GET";

        [Description("ListEdition")]
        public ServiceEndpointInformation ListEditionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListEdition,
                Verb = ListEditionVerb
            };
        }

        #endregion

        #region "GetEdition"

        public const string GetEdition = "/projects/{projectid}/editions/{id}";
        public const string GetEditionVerb = "GET";

        [Description("GetEdition")]
        public ServiceEndpointInformation GetEditionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetEdition,
                Verb = GetEditionVerb
            };
        }

        #endregion

        #region "CreateEdition"

        public const string CreateEdition = "/projects/{projectid}/editions";
        public const string CreateEditionVerb = "POST";

        [Description("CreateEdition")]
        public ServiceEndpointInformation CreateEditionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateEdition,
                Verb = CreateEditionVerb
            };
        }

        #endregion

        #region "UpdateEdition"

        public const string UpdateEdition = "/projects/{projectid}/editions";
        public const string UpdateEditionVerb = "PUT";

        [Description("UpdateEdition")]
        public ServiceEndpointInformation UpdateEditionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateEdition,
                Verb = UpdateEditionVerb
            };
        }

        #endregion

        #region "DeleteEdition"

        public const string DeleteEdition = "/projects/{projectid}/editions/{id}";
        public const string DeleteEditionVerb = "DELETE";

        [Description("DeleteEdition")]
        public ServiceEndpointInformation DeleteEditionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteEdition,
                Verb = DeleteEditionVerb
            };
        }

        #endregion

        #endregion

        #region Article

        #region "ListArticle"

        public const string ListArticle = "/projects/{projectid}/articles";
        public const string ListArticleVerb = "GET";

        [Description("ListArticle")]
        public ServiceEndpointInformation ListArticleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListArticle,
                Verb = ListArticleVerb
            };
        }

        #endregion

        #region "GetArticle"

        public const string GetArticle = "/projects/{projectid}/articles/{id}";
        public const string GetArticleVerb = "GET";

        [Description("GetArticle")]
        public ServiceEndpointInformation GetArticleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetArticle,
                Verb = GetArticleVerb
            };
        }

        #endregion

        #region "CreateArticle"

        public const string CreateArticle = "/projects/{projectid}/articles";
        public const string CreateArticleVerb = "POST";

        [Description("CreateArticle")]
        public ServiceEndpointInformation CreateArticleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateArticle,
                Verb = CreateArticleVerb
            };
        }

        #endregion

        #region "UpdateArticle"

        public const string UpdateArticle = "/projects/{projectid}/articles";
        public const string UpdateArticleVerb = "PUT";

        [Description("UpdateArticle")]
        public ServiceEndpointInformation UpdateArticleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateArticle,
                Verb = UpdateArticleVerb
            };
        }

        #endregion

        #region "DeleteArticle"

        public const string DeleteArticle = "/projects/{projectid}/articles/{id}";
        public const string DeleteArticleVerb = "DELETE";

        [Description("DeleteArticle")]
        public ServiceEndpointInformation DeleteArticleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteArticle,
                Verb = DeleteArticleVerb
            };
        }

        #endregion

        #region "UploadArticlePreview"

        public const string UploadArticlePreview = "/projects/{projectId}/articles/{articleId}?fileName={fileName}&fileLength={fileLength}";

        public const string UploadArticlePreviewVerb = "POST";

        [Description("UploadArticlePreview")]
        public ServiceEndpointInformation UploadArticlePreviewInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UploadArticlePreview,
                Verb = UploadArticlePreviewVerb
            };
        }

        #endregion

        #endregion

        #region SectionArticleMap

        #region "ListSectionArticleMap"

        public const string ListSectionArticleMap = "/projects/{projectid}/sections/{sectionid}/sectionarticlemaps";
        public const string ListSectionArticleMapVerb = "GET";

        [Description("ListSectionArticleMap")]
        public ServiceEndpointInformation ListSectionArticleMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListSectionArticleMap,
                Verb = ListSectionArticleMapVerb
            };
        }

        #endregion

        #region "GetSectionArticleMap"

        public const string GetSectionArticleMap = "/projects/{projectid}/sections/{sectionid}/sectionarticlemaps/{id}";
        public const string GetSectionArticleMapVerb = "GET";

        [Description("GetSectionArticleMap")]
        public ServiceEndpointInformation GetSectionArticleMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetSectionArticleMap,
                Verb = GetSectionArticleMapVerb
            };
        }

        #endregion

        #region "CreateSectionArticleMap"

        public const string CreateSectionArticleMap = "/projects/{projectid}/sections/{sectionid}/sectionarticlemaps";
        public const string CreateSectionArticleMapVerb = "POST";

        [Description("CreateSectionArticleMap")]
        public ServiceEndpointInformation CreateSectionArticleMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateSectionArticleMap,
                Verb = CreateSectionArticleMapVerb
            };
        }

        #endregion

        #region "UpdateSectionArticleMap"

        public const string UpdateSectionArticleMap = "/projects/{projectid}/sections/{sectionid}/sectionarticlemaps";
        public const string UpdateSectionArticleMapVerb = "PUT";

        [Description("UpdateSectionArticleMap")]
        public ServiceEndpointInformation UpdateSectionArticleMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateSectionArticleMap,
                Verb = UpdateSectionArticleMapVerb
            };
        }

        #endregion

        #region "DeleteSectionArticleMap"

        public const string DeleteSectionArticleMap = "/projects/{projectid}/sections/{sectionid}/sectionarticlemaps/{id}";
        public const string DeleteSectionArticleMapVerb = "DELETE";

        [Description("DeleteSectionArticleMap")]
        public ServiceEndpointInformation DeleteSectionArticleMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteSectionArticleMap,
                Verb = DeleteSectionArticleMapVerb
            };
        }

        #endregion

        #endregion

        #region ArticleInteraction

        #region "ApplyArticleInteraction"

        public const string ApplyArticleInteraction = "/projects/{projectid}/articleinteractions";
        public const string ApplyArticleInteractionVerb = "PUT";

        [Description("ApplyArticleInteraction")]
        public ServiceEndpointInformation ApplyArticleInteractionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ApplyArticleInteraction,
                Verb = ApplyArticleInteractionVerb
            };
        }

        #endregion

        #region "DeleteArticleInteraction"

        public const string DeleteArticleInteraction = "/projects/{projectid}/articles/{articleid}/articleinteractions?interactiontypeid={interactiontypeid}";
        public const string DeleteArticleInteractionVerb = "DELETE";

        [Description("DeleteArticleInteraction")]
        public ServiceEndpointInformation DeleteArticleInteractionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteArticleInteraction,
                Verb = DeleteArticleInteractionVerb
            };
        }

        #endregion

        #region "GetArticleInteraction"

        public const string GetArticleInteraction = "/projects/{projectid}/articles/{articleId}/articleinteractions";
        public const string GetArticleInteractionVerb = "GET";

        [Description("GetArticleInteraction")]
        public ServiceEndpointInformation GetArticleInteractionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetArticleInteraction,
                Verb = GetArticleInteractionVerb
            };
        }

        #endregion

        #region "ListArticleInteraction"

        public const string ListArticleInteraction = "/projects/{projectid}/articleinteractions";
        public const string ListArticleInteractionVerb = "GET";

        [Description("ListArticleInteraction")]
        public ServiceEndpointInformation ListArticleInteractionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListArticleInteraction,
                Verb = ListArticleInteractionVerb
            };
        }

        #endregion

        #endregion

        #region Feed

        #region "ListFeed"

        public const string ListFeed = "/projects/{projectid}/feeds";
        public const string ListFeedVerb = "GET";

        [Description("ListFeed")]
        public ServiceEndpointInformation ListFeedInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListFeed,
                Verb = ListFeedVerb
            };
        }

        #endregion

        #region "ListAllPendingFeed"

        public const string ListAllPendingFeed = "/feeds";
        public const string ListAllPendingFeedVerb = "GET";

        [Description("ListAllPendingFeed")]
        public ServiceEndpointInformation ListAllPendingFeedInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListAllPendingFeed,
                Verb = ListAllPendingFeedVerb
            };
        }

        #endregion

        #region "GetFeed"

        public const string GetFeed = "/projects/{projectid}/feeds/{id}";
        public const string GetFeedVerb = "GET";

        [Description("GetFeed")]
        public ServiceEndpointInformation GetFeedInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetFeed,
                Verb = GetFeedVerb
            };
        }

        #endregion

        #region "CreateFeed"

        public const string CreateFeed = "/projects/{projectid}/feeds";
        public const string CreateFeedVerb = "POST";

        [Description("CreateFeed")]
        public ServiceEndpointInformation CreateFeedInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateFeed,
                Verb = CreateFeedVerb
            };
        }

        #endregion

        #region "UpdateFeed"

        public const string UpdateFeed = "/projects/{projectid}/feeds";
        public const string UpdateFeedVerb = "PUT";

        [Description("UpdateFeed")]
        public ServiceEndpointInformation UpdateFeedInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateFeed,
                Verb = UpdateFeedVerb
            };
        }

        #endregion

        #region "DeleteFeed"

        public const string DeleteFeed = "/projects/{projectid}/feeds/{id}";
        public const string DeleteFeedVerb = "DELETE";

        [Description("DeleteFeed")]
        public ServiceEndpointInformation DeleteFeedInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteFeed,
                Verb = DeleteFeedVerb
            };
        }

        #endregion

        #endregion

        #region FeedLog

        #region "CreateFeedLog"

        public const string CreateFeedLog = "/projects/{projectid}/feedlogs";
        public const string CreateFeedLogVerb = "POST";

        [Description("CreateFeedLog")]
        public ServiceEndpointInformation CreateFeedLogInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateFeedLog,
                Verb = CreateFeedLogVerb
            };
        }

        #endregion

        #endregion

        #region Asset

        #region "ListAsset"

        public const string ListAsset = "/projects/{projectid}/articles/{articleid}/assets";
        public const string ListAssetVerb = "GET";

        [Description("ListAsset")]
        public ServiceEndpointInformation ListAssetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListAsset,
                Verb = ListAssetVerb
            };
        }

        #endregion

        #region "GetAsset"

        public const string GetAsset = "/projects/{projectid}/articles/{articleid}/assets/{id}";
        public const string GetAssetVerb = "GET";

        [Description("GetAsset")]
        public ServiceEndpointInformation GetAssetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetAsset,
                Verb = GetAssetVerb
            };
        }

        #endregion

        #region "CreateAsset"

        public const string CreateAsset = "/projects/{projectid}/articles/{articleid}/assets";
        public const string CreateAssetVerb = "POST";

        [Description("CreateAsset")]
        public ServiceEndpointInformation CreateAssetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateAsset,
                Verb = CreateAssetVerb
            };
        }

        #endregion

        #region "UpdateAsset"

        public const string UpdateAsset = "/projects/{projectid}/articles/{articleid}/assets";
        public const string UpdateAssetVerb = "PUT";

        [Description("UpdateAsset")]
        public ServiceEndpointInformation UpdateAssetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateAsset,
                Verb = UpdateAssetVerb
            };
        }

        #endregion

        #region "DeleteAsset"

        public const string DeleteAsset = "/projects/{projectid}/articles/{articleid}/assets/{id}";
        public const string DeleteAssetVerb = "DELETE";

        [Description("DeleteAsset")]
        public ServiceEndpointInformation DeleteAssetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteAsset,
                Verb = DeleteAssetVerb
            };
        }

        #endregion

        #region "UploadAsset"

        public const string UploadAsset = "/projects/{projectId}/articles/{articleId}/assets/{assetId}?fileName={fileName}&fileLength={fileLength}";

        public const string UploadAssetVerb = "POST";

        [Description("UploadAsset")]
        public ServiceEndpointInformation UploadAssetInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UploadAsset,
                Verb = UploadAssetVerb
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
