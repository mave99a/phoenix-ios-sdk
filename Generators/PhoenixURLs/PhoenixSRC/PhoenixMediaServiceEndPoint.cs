namespace Tigerspike.PhoenixMedia.V1.Url
{
    using System.ComponentModel;

    using Tigerspike.Phoenix.Services.Url.Attributes;
    using Tigerspike.Phoenix.Services.Url.Services;

    /// <summary>
    /// Identity Service Rest endpoint URLs
    /// </summary>
    [ServiceEndPoint(Version1)]
    public class PhoenixMediaServiceEndPoint : PhoenixServiceApi
    {
        #region Media

        #region "ListMedia"

        public const string ListMedia = "/projects/{projectId}/media";

        public const string ListMediaVerb = "GET";

        [Description("ListMedia")]
        public ServiceEndpointInformation ListMediaInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListMedia,
                Verb = ListMediaVerb
            };
        }

        #endregion

        #region "GetMedia"

        public const string GetMedia = "/projects/{projectId}/media/{id}";

        public const string GetMediaVerb = "GET";

        [Description("GetMedia")]
        public ServiceEndpointInformation GetMediaInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetMedia,
                Verb = GetMediaVerb
            };
        }

        #endregion

        #region "CreateMedia"

        public const string CreateMedia = "/projects/{projectId}/media";

        public const string CreateMediaVerb = "POST";

        [Description("CreateMedia")]
        public ServiceEndpointInformation CreateMediaInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateMedia,
                Verb = CreateMediaVerb
            };
        }

        #endregion

        #region "UpdateMedia"

        public const string UpdateMedia = "/projects/{projectId}/media";

        public const string UpdateMediaVerb = "PUT";

        [Description("UpdateMedia")]
        public ServiceEndpointInformation UpdateMediaInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateMedia,
                Verb = UpdateMediaVerb
            };
        }

        #endregion

        #region "DeleteMedia"

        public const string DeleteMedia = "/projects/{projectId}/media/{mediaId}";

        public const string DeleteMediaVerb = "DELETE";

        [Description("DeleteMedia")]
        public ServiceEndpointInformation DeleteMediaInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteMedia,
                Verb = DeleteMediaVerb
            };
        }

        #endregion

        #region "UploadMediaFile"
        public const string UploadMediaFile = "/projects/{projectId}/media/{id}/file?fileName={fileName}&fileLength={fileLength}";

        public const string UploadMediaFileVerb = "POST";

        [Description("UploadMediaFile")]
        public ServiceEndpointInformation UploadMediaFileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UploadMediaFile,
                Verb = UploadMediaFileVerb
            };
        }
        #endregion

        #region "UploadMedia"

        public const string UploadMedia = "/projects/{projectId}/media/{id}?fileName={fileName}&fileLength={fileLength}";

        public const string UploadMediaVerb = "POST";

        [Description("UploadMedia")]
        public ServiceEndpointInformation UploadMediaInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UploadMedia,
                Verb = UploadMediaVerb
            };
        }

        #endregion

        #region "AddMediaFileType"

        public const string AddMediaFileType = "/projects/{projectId}/mediafiletype";

        public const string AddMediaFileTypeVerb = "POST";

        [Description("AddMediaFileType")]
        public ServiceEndpointInformation AddMediaFileTypeInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = AddMediaFileType,
                Verb = AddMediaFileTypeVerb
            };
        }

        #endregion

        #endregion

        #region Categories

        #region "ListCategory"

        public const string ListCategory = "/projects/{projectId}/categories";

        public const string ListCategoryVerb = "GET";

        [Description("ListCategory")]
        public ServiceEndpointInformation ListCategoryInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListCategory,
                Verb = ListCategoryVerb
            };
        }

        #endregion

        #region "GetCategory"

        public const string GetCategory = "/projects/{projectId}/categories/{id}";

        public const string GetCategoryVerb = "GET";

        [Description("GetCategory")]
        public ServiceEndpointInformation GetCategoryInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetCategory,
                Verb = GetCategoryVerb
            };
        }

        #endregion

        #region "UpdateCategory"

        public const string UpdateCategory = "/projects/{projectId}/categories";

        public const string UpdateCategoryVerb = "PUT";

        [Description("UpdateCategory")]
        public ServiceEndpointInformation UpdateCategoryInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateCategory,
                Verb = UpdateCategoryVerb
            };
        }

        #endregion

        #region "CreateCategory"

        public const string CreateCategory = "/projects/{projectId}/categories";

        public const string CreateCategoryVerb = "POST";

        [Description("CreateCategory")]
        public ServiceEndpointInformation CreateCategoryInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateCategory,
                Verb = CreateCategoryVerb
            };
        }

        #endregion

        #region "DeleteCategory"

        public const string DeleteCategory = "/projects/{projectId}/categories/{categoryId}";

        public const string DeleteCategoryVerb = "DELETE";

        [Description("DeleteCategory")]
        public ServiceEndpointInformation DeleteCategoryInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateCategory,
                Verb = CreateCategoryVerb
            };
        }

        #endregion

        #endregion

        #region Tags

        #region "ListTag"

        public const string ListTag = "/projects/{projectId}/tags";

        public const string ListTagVerb = "GET";

        [Description("ListTag")]
        public ServiceEndpointInformation ListTagInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListTag,
                Verb = ListTagVerb
            };
        }

        #endregion

        #region "GetTag"

        public const string GetTag = "/projects/{projectId}/tags/{id}";

        public const string GetTagVerb = "GET";

        [Description("GetTag")]
        public ServiceEndpointInformation GetTagInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetTag,
                Verb = GetTagVerb
            };
        }

        #endregion

        #region "CreateTag"

        public const string CreateTag = "/projects/{projectId}/tags";

        public const string CreateTagVerb = "POST";

        [Description("CreateTag")]
        public ServiceEndpointInformation CreateTagInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateTag,
                Verb = CreateTagVerb
            };
        }

        #endregion

        #region "DeleteTag"

        public const string DeleteTag = "/projects/{projectId}/tags/{tagId}";

        public const string DeleteTagVerb = "DELETE";

        [Description("DeleteTag")]
        public ServiceEndpointInformation DeleteTagInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateTag,
                Verb = CreateTagVerb
            };
        }

        #endregion
        #endregion

        #region Channels

        #region "ListChannel"

        public const string ListChannel = "/projects/{projectId}/channels";

        public const string ListChannelVerb = "GET";

        [Description("ListChannel")]
        public ServiceEndpointInformation ListChannelInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListChannel,
                Verb = ListChannelVerb
            };
        }

        #endregion

        #region "GetChannel"

        public const string GetChannel = "/projects/{projectId}/channels/{id}";

        public const string GetChannelVerb = "GET";

        [Description("GetChannel")]
        public ServiceEndpointInformation GetChannelnformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetChannel,
                Verb = GetChannelVerb
            };
        }

        #endregion

        #region "CreateChannel"

        public const string CreateChannel = "/projects/{projectId}/channels";

        public const string CreateChannelVerb = "POST";

        [Description("CreateChannel")]
        public ServiceEndpointInformation CreateChannelInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateChannel,
                Verb = CreateChannelVerb
            };
        }

        #endregion

        #region "UpdateChannel"

        public const string UpdateChannel = "/projects/{projectId}/channels";

        public const string UpdateChannelVerb = "PUT";

        [Description("UpdateChannel")]
        public ServiceEndpointInformation UpdateChannelInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateChannel,
                Verb = UpdateChannelVerb
            };
        }

        #endregion

        #region "DeleteChannel"

        public const string DeleteChannel = "/projects/{projectId}/channels/{id}";

        public const string DeleteChannelVerb = "DELETE";

        [Description("DeleteChannel")]
        public ServiceEndpointInformation DeleteChannelInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteChannel,
                Verb = DeleteChannelVerb
            };
        }

        #endregion

        #region "ListMediaAssignedToChannel"

        public const string ListMediaAssignedToChannel = "/projects/{projectId}/channels/{channelId}/media";

        public const string ListMediaAssignedToChannelVerb = "GET";

        [Description("ListMediaAssignedToChannel")]
        public ServiceEndpointInformation ListMediaAssignedToChannelInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListMediaAssignedToChannel,
                Verb = ListMediaAssignedToChannelVerb
            };
        }

        #endregion

        #region "AddMediaToChannel"

        public const string AddMediaToChannel = "/projects/{projectId}/channels/{channelId}/media/{id}";

        public const string AddMediaToChannelVerb = "POST";

        [Description("AddMediaToChannel")]
        public ServiceEndpointInformation AddMediaToChannelInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = AddMediaToChannel,
                Verb = AddMediaToChannelVerb
            };
        }

        #endregion

        #region "RemoveMediaFromChannel"

        public const string RemoveMediaFromChannel = "/projects/{projectId}/channels/{channelId}/media/{id}";

        public const string RemoveMediaFromChannelVerb = "DELETE";

        [Description("RemoveMediaFromChannel")]
        public ServiceEndpointInformation RemoveMediaFromChannelInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = RemoveMediaFromChannel,
                Verb = RemoveMediaFromChannelVerb
            };
        }

        #endregion

        #region "ListChannelSubscribers"

        public const string ListChannelSubscribers = "/projects/{projectId}/channels/{channelId}/subscribers";

        public const string ListChannelSubscribersVerb = "GET";

        [Description("ListChannelSubscribers")]
        public ServiceEndpointInformation ListChannelSubscribersInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListChannelSubscribers,
                Verb = ListChannelSubscribersVerb
            };
        }

        #endregion

        #region "SubscribeToChannel"

        public const string SubscribeToChannel = "/projects/{projectId}/profiles/{profileId}/subscription";

        public const string SubscribeToChannelVerb = "POST";

        [Description("SubscribeToChannel")]
        public ServiceEndpointInformation SubscribeToChannelInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = SubscribeToChannel,
                Verb = SubscribeToChannelVerb
            };
        }

        #endregion

        #region "UnSubscribeFromChannel"

        public const string UnSubscribeFromChannel = "/projects/{projectId}/profiles/{profileId}/subscription/{channelId}";

        public const string UnSubscribeFromChannelVerb = "DELETE";

        [Description("UnSubscribeFromChannel")]
        public ServiceEndpointInformation UnSubscribeFromChannelInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UnSubscribeFromChannel,
                Verb = UnSubscribeFromChannelVerb
            };
        }

        #endregion

        #region "UploadChannelImage"

        public const string UploadChannelImage = "/projects/{projectId}/channels/{id}?fileName={fileName}&fileLength={fileLength}";

        public const string UploadChannelImageVerb = "POST";

        [Description("UploadChannelImage")]
        public ServiceEndpointInformation UploadChannelImageInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UploadChannelImage,
                Verb = UploadChannelImageVerb
            };
        }

        #endregion

        #endregion

        #region Profiles

        #region "ListProfiles"

        public const string ListProfile = "/projects/{projectId}/profiles";

        public const string ListProfileVerb = "GET";

        [Description("ListProfile")]
        public ServiceEndpointInformation ListProfileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListProfile,
                Verb = ListProfileVerb
            };
        }

        #endregion 

        #region "GetProfile"

        public const string GetProfile = "/projects/{projectId}/profiles/{id}";

        public const string GetProfileVerb = "GET";

        [Description("GetProfile")]
        public ServiceEndpointInformation GetProfileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetProfile,
                Verb = GetProfileVerb
            };
        }

        #endregion

        #region "CreateProfile"

        public const string CreateProfile = "/projects/{projectId}/profiles";

        public const string CreateProfileVerb = "POST";

        [Description("CreateProfile")]
        public ServiceEndpointInformation CreateProfileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateProfile,
                Verb = CreateProfileVerb
            };
        }

        #endregion

        #region "UpdateProfile"

        public const string UpdateProfile = "/projects/{projectId}/profiles";

        public const string UpdateProfileVerb = "PUT";

        [Description("UpdateProfile")]
        public ServiceEndpointInformation UpdateProfileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateProfile,
                Verb = UpdateProfileVerb
            };
        }

        #endregion

        #region "DeleteProfile"

        public const string DeleteProfile = "/projects/{projectId}/profiles/{id}";

        public const string DeleteProfileVerb = "DELETE";

        [Description("DeleteProfile")]
        public ServiceEndpointInformation DeleteProfileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteProfile,
                Verb = DeleteProfileVerb
            };
        }

        #endregion

        #region "UploadProfile"

        public const string UploadProfile = "/projects/{projectId}/profiles/{id}?fileName={fileName}&fileLength={fileLength}";

        public const string UploadProfileVerb = "POST";

        [Description("UploadProfile")]
        public ServiceEndpointInformation UploadProfileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UploadProfile,
                Verb = UploadProfileVerb
            };
        }

        #endregion

        #endregion

        #region Interactions

        #region "RateProfile"

        public const string RateProfile = "/projects/{projectId}/profiles/{id}/rate?rate={rate}&ipAddress={ipAddress}";

        public const string RateProfileVerb = "POST";

        [Description("RateProfile")]
        public ServiceEndpointInformation RateProfileInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = RateProfile,
                Verb = RateProfileVerb
            };
        }

        #endregion

        #region "RateMedia"

        public const string RateMedia = "/projects/{projectId}/media/{id}/rate";

        public const string RateMediaVerb = "POST";

        [Description("RateMedia")]
        public ServiceEndpointInformation RateMediaInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = RateMedia,
                Verb = RateMediaVerb
            };
        }

        #endregion

        #region "ViewMedia"

        public const string ViewMedia = "/projects/{projectId}/media/{id}/view";

        public const string ViewMediaVerb = "POST";

        [Description("ViewMedia")]
        public ServiceEndpointInformation ViewMediaInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ViewMedia,
                Verb = ViewMediaVerb
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

        public const string ActivateModule = "/projects";

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

        #region MediaFileTypes

        #region "ListMediaFileType"

        public const string ListMediaFileType = "/mediafiletypes";

        public const string ListMediaFileTypeVerb = "GET";

        [Description("ListMediaFileType")]
        public ServiceEndpointInformation ListMediaFileTypeInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListMediaFileType,
                Verb = ListMediaFileTypeVerb
            };
        }

        #endregion

        #region "GetMediaFileType"

        public const string GetMediaFileType = "/mediafiletypes/{id}";

        public const string GetMediaFileTypeVerb = "GET";

        [Description("GetMediaFileType")]
        public ServiceEndpointInformation GetMediaFileTypeInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetMediaFileType,
                Verb = GetMediaFileTypeVerb
            };
        }

        #endregion

        #region "UpdateMediaFileType"

        public const string UpdateMediaFileType = "/mediafiletypes";

        public const string UpdateMediaFileTypeVerb = "PUT";

        [Description("UpdateMediaFileType")]
        public ServiceEndpointInformation UpdateMediaFileTypeInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateMediaFileType,
                Verb = UpdateMediaFileTypeVerb
            };
        }

        #endregion

        #region "CreateMediaFileType"

        public const string CreateMediaFileType = "/mediafiletypes";

        public const string CreateMediaFileTypeVerb = "POST";

        [Description("CreateMediaFileType")]
        public ServiceEndpointInformation CreateMediaFileTypeInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateMediaFileType,
                Verb = CreateMediaFileTypeVerb
            };
        }

        #endregion

        #region "DeleteMediaFileType"

        public const string DeleteMediaFileType = "/mediafiletypes/{id}";

        public const string DeleteMediaFileTypeVerb = "DELETE";

        [Description("DeleteMediaFileType")]
        public ServiceEndpointInformation DeleteMediaFileTypeInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateMediaFileType,
                Verb = CreateMediaFileTypeVerb
            };
        }

        #endregion

        #endregion

        #region ProjectMediaFileTypeMaps

        #region "ListProjectMediaFileTypeMap"

        public const string ListProjectMediaFileTypeMap = "/projects/{projectId}/mediafiletypes";

        public const string ListProjectMediaFileTypeMapVerb = "GET";

        [Description("ListProjectMediaFileTypeMap")]
        public ServiceEndpointInformation ListProjectMediaFileTypeMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListProjectMediaFileTypeMap,
                Verb = ListProjectMediaFileTypeMapVerb
            };
        }

        #endregion

        #region "CreateProjectMediaFileTypeMap"

        public const string CreateProjectMediaFileTypeMap = "/projects/{projectId}/mediafiletypes";

        public const string CreateProjectMediaFileTypeMapVerb = "POST";

        [Description("CreateProjectMediaFileTypeMap")]
        public ServiceEndpointInformation CreateProjectMediaFileTypeMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateProjectMediaFileTypeMap,
                Verb = CreateProjectMediaFileTypeMapVerb
            };
        }

        #endregion

        #region "DeleteProjectMediaFileTypeMap"

        public const string DeleteProjectMediaFileTypeMap = "/projects/{projectId}/mediafiletypes/{projectMediaFileTypeMapId}";

        public const string DeleteProjectMediaFileTypeMapVerb = "DELETE";

        [Description("DeleteProjectMediaFileTypeMap")]
        public ServiceEndpointInformation DeleteProjectMediaFileTypeMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateProjectMediaFileTypeMap,
                Verb = CreateProjectMediaFileTypeMapVerb
            };
        }

        #endregion

        #endregion
    }
}
