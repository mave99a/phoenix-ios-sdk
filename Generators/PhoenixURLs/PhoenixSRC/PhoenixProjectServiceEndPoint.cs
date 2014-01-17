namespace Tigerspike.PhoenixProject.V1.Url
{
    using System.ComponentModel;

    using Tigerspike.Phoenix.Services.Url.Attributes;
    using Tigerspike.Phoenix.Services.Url.Services;

    /// <summary>
    /// Identity Service Rest endpoint URLs
    /// </summary>
    [ServiceEndPoint(Version1)]
    public class PhoenixProjectServiceEndPoint : PhoenixServiceApi
    {
        #region Provider

        #region "ListProvider"

        public const string ListProvider = "/providers";

        public const string ListProviderVerb = "GET";

        [Description("ListProvider")]
        public ServiceEndpointInformation ListProviderInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListProvider,
                Verb = ListProviderVerb
            };
        }

        #endregion

        #region "GetProvider"

        public const string GetProvider = "/providers/{id}";

        public const string GetProviderVerb = "GET";

        [Description("GetProvider")]
        public ServiceEndpointInformation GetProviderInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetProvider,
                Verb = GetProviderVerb
            };
        }

        #endregion

        #region "CreateProvider"

        public const string CreateProvider = "/providers";

        public const string CreateProviderVerb = "POST";

        [Description("CreateProvider")]
        public ServiceEndpointInformation CreateProviderInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateProvider,
                Verb = CreateProviderVerb
            };
        }

        #endregion

        #endregion

        #region Company

        #region "ListCompany"

        public const string ListCompany = "/providers/{providerId}/companies";

        public const string ListCompanyVerb = "GET";

        [Description("ListCompany")]
        public ServiceEndpointInformation ListCompanyInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListCompany,
                Verb = ListCompanyVerb
            };
        }

        #endregion

        #region "GetCompany"

        public const string GetCompany = "/providers/{providerId}/companies/{companyId}";

        public const string GetCompanyVerb = "GET";

        [Description("GetCompany")]
        public ServiceEndpointInformation GetCompanyInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetCompany,
                Verb = GetCompanyVerb
            };
        }

        #endregion

        #region "CreateCompany"

        public const string CreateCompany = "/providers/{providerId}/companies";

        public const string CreateCompanyVerb = "POST";

        [Description("CreateCompany")]
        public ServiceEndpointInformation CreateCompanyInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateCompany,
                Verb = CreateCompanyVerb
            };
        }

        #endregion

        #endregion

        #region Domain

        #region "ListDomain"

        public const string ListDomain = "/providers/{providerId}/domains";

        public const string ListDomainVerb = "GET";

        [Description("ListDomain")]
        public ServiceEndpointInformation ListDomainInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListDomain,
                Verb = ListDomainVerb
            };
        }

        #endregion

        #region "GetDomain"

        public const string GetDomain = "/providers/{providerId}/domains/{id}";

        public const string GetDomainVerb = "GET";

        [Description("GetDomain")]
        public ServiceEndpointInformation GetDomainInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetDomain,
                Verb = GetDomainVerb
            };
        }

        #endregion

        #region "CreateDomain"

        public const string CreateDomain = "/providers/{providerId}/domains";

        public const string CreateDomainVerb = "POST";

        [Description("CreateDomain")]
        public ServiceEndpointInformation CreateDomainInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateDomain,
                Verb = CreateDomainVerb
            };
        }

        #endregion

        #region "UpdateDomain"

        public const string UpdateDomain = "/providers/{providerId}/domains";

        public const string UpdateDomainVerb = "PUT";

        [Description("UpdateDomain")]
        public ServiceEndpointInformation UpdateDomainInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateDomain,
                Verb = UpdateDomainVerb
            };
        }

        #endregion

        #region "DeleteDomain"

        public const string DeleteDomain = "/providers/{providerId}/domains/{id}";

        public const string DeleteDomainVerb = "DELETE";

        [Description("DeleteDomain")]
        public ServiceEndpointInformation DeleteDomainInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteDomain,
                Verb = DeleteDomainVerb
            };
        }

        #endregion

        #endregion

        #region Project

        #region "GetProject"

        public const string GetProject = "/projects/{projectId}";

        public const string GetProjectVerb = "GET";

        [Description("GetProject")]
        public ServiceEndpointInformation GetProjectInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetProject,
                Verb = GetProjectVerb
            };
        }

        #endregion

        #region "ListProject"

        public const string ListProject = "/providers/{providerid}/projects";

        public const string ListProjectVerb = "GET";

        [Description("ListProject")]
        public ServiceEndpointInformation ListProjectInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListProject,
                Verb = ListProjectVerb
            };
        }

        #endregion

        #region "CreateProject"

        public const string CreateProject = "/companies/{companyId}/projects";

        public const string CreateProjectVerb = "POST";

        [Description("CreateProject")]
        public ServiceEndpointInformation CreateProjectInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateProject,
                Verb = CreateProjectVerb
            };
        }

        #endregion

        #region "UpdateProject"

        public const string UpdateProject = "/companies/{companyId}/projects";

        public const string UpdateProjectVerb = "PUT";

        [Description("UpdateProject")]
        public ServiceEndpointInformation UpdateProjectInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateProject,
                Verb = UpdateProjectVerb
            };
        }

        #endregion


        #region "ListProjectModuleMap"

        public const string ListProjectModuleMap = "/projects/{projectId}/modules";

        public const string ListProjectModuleMapVerb = "GET";

        [Description("ListProjectModuleMap")]
        public ServiceEndpointInformation ListProjectModuleMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListProjectModuleMap,
                Verb = ListProjectModuleMapVerb
            };
        }

        #endregion

        #endregion

        #region User

        #region "GetMyUser"
        public const string GetMyUser = "/users/me";

        public const string GetMyUserVerb = "GET";

        [Description("GetMyUser")]
        public ServiceEndpointInformation GetMyUserInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetMyUser,
                Verb = GetMyUserVerb
            };
        }
        #endregion

        #region "CreateUser"
        public const string CreateUser = "/projects/{projectid}/users";

        public const string CreateUserVerb = "POST";

        [Description("CreateUser")]
        public ServiceEndpointInformation CreateUserInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateUser,
                Verb = CreateUserVerb
            };
        }
        #endregion

        #region "UpdateUser"
        public const string UpdateUser = "/projects/{projectid}/users/{id}";

        public const string UpdateUserVerb = "PUT";

        [Description("UpdateUser")]
        public ServiceEndpointInformation UpdateUserInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateUser,
                Verb = UpdateUserVerb
            };
        }
        #endregion

        #region "GetUser"
        public const string GetUser = "/projects/{projectid}/users/{id}";

        public const string GetUserVerb = "GET";

        [Description("GetUser")]
        public ServiceEndpointInformation GetUserInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetUser,
                Verb = GetUserVerb
            };
        }
        #endregion

        #region "ListUser"

        public const string ListUser = "/projects/{projectid}/users";

        public const string ListUserVerb = "GET";

        [Description("ListUser")]
        public ServiceEndpointInformation ListUserInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListUser,
                Verb = ListUserVerb
            };
        }

        #endregion

        #region "RetrievePassword"

        public const string RetrievePassword = "/projects/{projectId}/users/retrievepassword?username={username}&target={verificationTarget}&templateId={templateId}";
        public const string RetrievePasswordVerb = "GET";

        [Description("RetrievePassword")]
        public ServiceEndpointInformation RetrievePasswordInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = RetrievePassword,
                Verb = RetrievePasswordVerb
            };
        }
        #endregion

        #region "ResetPassword"

        public const string ResetPassword = "/projects/{projectId}/users/resetpassword";
        public const string ResetPasswordVerb = "PUT";

        [Description("ResetPassword")]
        public ServiceEndpointInformation ResetPasswordInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ResetPassword,
                Verb = ResetPasswordVerb
            };
        }
        #endregion

        #region "ChangePassword"

        public const string ChangePassword = "/projects/{projectId}/users/me/changepassword";
        public const string ChangePasswordVerb = "PUT";

        [Description("ChangePassword")]
        public ServiceEndpointInformation ChangePasswordInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ChangePassword,
                Verb = ChangePasswordVerb
            };
        }
        #endregion


        #region "UploadUserImage"
        public const string UploadUserImage = "/projects/{projectId}/users/{id}?fileName={fileName}&fileLength={fileLength}";

        public const string UploadUserImageVerb = "POST";

        [Description("UploadUserImage")]
        public ServiceEndpointInformation UploadUserImageInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UploadUserImage,
                Verb = UploadUserImageVerb
            };
        }
        #endregion

        #endregion

        #region Identifier

        #region "ListIdentifier"
        public const string ListIdentifier = "/projects/{projectid}/users/{userid}/identifiers";

        public const string ListIdentifierVerb = "GET";

        [Description("ListIdentifier")]
        public ServiceEndpointInformation ListIdentifierInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListIdentifier,
                Verb = ListIdentifierVerb
            };
        }
        #endregion

        #region "GetIdentifier"
        public const string GetIdentifier = "/projects/{projectid}/users/{userid}/identifiers/{identifierid}";
        public const string GetIdentifierVerb = "GET";

        [Description("GetIdentifier")]
        public ServiceEndpointInformation GetIdentifierInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetIdentifier,
                Verb = GetIdentifierVerb
            };
        }
        #endregion

        #region "CreateIdentifier"
        public const string CreateIdentifier = "/projects/{projectid}/users/{userid}/identifiers";

        public const string CreateIdentifierVerb = "POST";

        [Description("CreateIdentifier")]
        public ServiceEndpointInformation CreateIdentifierInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateIdentifier,
                Verb = CreateIdentifierVerb
            };
        }
        #endregion

        #region "DeleteIdentifier"
        public const string DeleteIdentifier = "/projects/{projectid}/users/{userid}/identifiers/{identifierid}";
        public const string DeleteIdentifierVerb = "DELETE";

        [Description("DeleteIdentifier")]
        public ServiceEndpointInformation DeleteIdentifierInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteIdentifier,
                Verb = DeleteIdentifierVerb
            };
        }
        #endregion

        #region "VerifyIdentifier"
        public const string VerifyIdentifier = "/projects/{projectid}/users/identifiers/verify?target={verificationTarget}&tokenId={tokenId}";
        public const string VerifyIdentifierVerb = "POST";

        [Description("VerifyIdentifier")]
        public ServiceEndpointInformation VerifyIdentifierInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = VerifyIdentifier,
                Verb = VerifyIdentifierVerb
            };
        }
        #endregion

        #region "SendVerification"

        public const string SendVerification = "/projects/{projectId}/users/{userId}/sendverification?target={verificationTarget}&templateId={templateId}";

        public const string SendVerificationVerb = "GET";

        [Description("SendVerification")]
        public ServiceEndpointInformation SendVerificationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = SendVerification,
                Verb = SendVerificationVerb
            };
        }
        #endregion

        #endregion

        #region Group

        #region "ListGroup"
        public const string ListGroup = "/projects/{projectid}/groups";
        public const string ListGroupVerb = "GET";

        [Description("ListGroup")]
        public ServiceEndpointInformation ListGroupInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListGroup,
                Verb = ListGroupVerb
            };
        }
        #endregion

        #region "GetGroup"

        public const string GetGroup = "/projects/{projectid}/groups/{id}";
        public const string GetGroupVerb = "GET";

        [Description("GetGroup")]
        public ServiceEndpointInformation GetGroupInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetGroup,
                Verb = GetGroupVerb
            };
        }
        #endregion

        #region "CreateGroup"
        public const string CreateGroup = "/projects/{projectid}/groups";
        public const string CreateGroupVerb = "POST";

        [Description("CreateGroup")]
        public ServiceEndpointInformation CreateGroupInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateGroup,
                Verb = CreateGroupVerb
            };
        }
        #endregion

        #region "UpdateGroup"

        public const string UpdateGroup = "/projects/{projectid}/groups";
        public const string UpdateGroupVerb = "PUT";

        [Description("UpdateGroup")]
        public ServiceEndpointInformation UpdateGroupInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateGroup,
                Verb = UpdateGroupVerb
            };
        }
        #endregion

        #region "DeleteGroup"
        public const string DeleteGroup = "/projects/{projectid}/groups/{id}";
        public const string DeleteGroupVerb = "DELETE";

        [Description("DeleteGroup")]
        public ServiceEndpointInformation DeleteGroupInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteGroup,
                Verb = DeleteGroupVerb
            };
        }
        #endregion

        #endregion

        #region Membership

        #region "GetMembership"

        public const string GetMembership = "/projects/{projectid}/users/{userid}/memberships/{id}";
        public const string GetMembershipVerb = "GET";

        [Description("GetMembership")]
        public ServiceEndpointInformation GetMembershipInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetMembership,
                Verb = GetMembershipVerb
            };
        }
        #endregion

        #region "UpdateMembership"

        public const string UpdateMembership = "/projects/{projectid}/users/{userid}/memberships";
        public const string UpdateMembershipVerb = "PUT";

        [Description("UpdateMembership")]
        public ServiceEndpointInformation UpdateMembershipInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateMembership,
                Verb = UpdateMembershipVerb
            };
        }
        #endregion

        #region "CreateMembership"

        public const string CreateMembership = "/projects/{projectid}/memberships";
        public const string CreateMembershipVerb = "POST";

        [Description("CreateMembership")]
        public ServiceEndpointInformation CreateMembershipInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateMembership,
                Verb = CreateMembershipVerb
            };
        }

        #endregion

        #region "ListMembership"

        public const string ListMembership = "/projects/{projectid}/memberships?userid={userid}&identifierid={identifierid}";
        public const string ListMembershipVerb = "GET";

        [Description("ListMembership")]
        public ServiceEndpointInformation ListMembershipInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListMembership,
                Verb = ListMembershipVerb
            };
        }
        #endregion

        #region "ListGroupMembers"

        public const string ListGroupMembers = "/projects/{projectid}/groups/{groupid}/memberships";
        public const string ListGroupMembersVerb = "GET";

        [Description("ListGroupMembers")]
        public ServiceEndpointInformation ListGroupMembersInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListGroupMembers,
                Verb = ListGroupMembersVerb
            };
        }
        #endregion

        #region "ListGroupIdentifiers"

        public const string ListGroupIdentifiers = "/projects/{projectid}/groups/{groupid}/identifiers";
        public const string ListGroupIdentifiersVerb = "GET";

        [Description("ListGroupIdentifiers")]
        public ServiceEndpointInformation ListGroupIdentifiersInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListGroupIdentifiers,
                Verb = ListGroupIdentifiersVerb
            };
        }
        #endregion

        #region "DeleteMembership"

        public const string DeleteMembership = "/projects/{projectid}/groups/{groupid}/memberships?userid={userid}&identifierid={identifierid}";
        public const string DeleteMembershipVerb = "DELETE";

        [Description("DeleteMembership")]
        public ServiceEndpointInformation DeleteMembershipInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteMembership,
                Verb = DeleteMembershipVerb
            };
        }
        #endregion

        #endregion

        #region Module

        #region "GetModule"

        public const string GetModule = "/modules/{moduleid}";
        public const string GetModuleVerb = "GET";

        [Description("GetModule")]
        public ServiceEndpointInformation GetModuleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetModule,
                Verb = GetModuleVerb
            };
        }

        #endregion

        #region "ListModule"

        public const string ListModule = "/providers/{providerid}/modules";
        public const string ListModuleVerb = "GET";

        [Description("ListModule")]
        public ServiceEndpointInformation ListModuleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListModule,
                Verb = ListModuleVerb
            };
        }

        #endregion

        #region "ListProviderModule"

        public const string ListProviderModule = "/providers/module";

        public const string ListProviderModuleVerb = "GET";

        [Description("ListProviderModule")]
        public ServiceEndpointInformation ListProviderModuleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListProviderModule,
                Verb = ListProviderModuleVerb
            };
        }

        #endregion

        #region "ListProjectModule"

        public const string ListProjectModule = "/projects/module";

        public const string ListProjectModuleVerb = "GET";

        [Description("ListProjectModule")]
        public ServiceEndpointInformation ListProjectModuleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListProjectModule,
                Verb = ListProjectModuleVerb
            };
        }

        #endregion

        #region "CreateModule"

        public const string CreateModule = "/modules";

        public const string CreateModuleVerb = "POST";

        [Description("CreateModule")]
        public ServiceEndpointInformation CreateModuleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateModule,
                Verb = CreateModuleVerb
            };
        }

        #endregion

        #region "UpdateModule"

        public const string UpdateModule = "/modules/{moduleid}";

        public const string UpdateModuleVerb = "PUT";

        [Description("UpdateModule")]
        public ServiceEndpointInformation UpdateModuleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateModule,
                Verb = UpdateModuleVerb
            };
        }

        #endregion

        #region "DeleteModule"

        public const string DeleteModule = "/modules/{moduleid}";

        public const string DeleteModuleVerb = "DELETE";

        [Description("DeleteModule")]
        public ServiceEndpointInformation DeleteModuleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteModule,
                Verb = DeleteModuleVerb
            };
        }

        #endregion

        #endregion

        #region Permission

        #region "AssignPermission"

        public const string AssignPermission = "/projects/{projectid}/users/{id}/permissions";

        public const string AssignPermissionVerb = "POST";

        [Description("AssignPermission")]
        public ServiceEndpointInformation AssignPermissionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = AssignPermission,
                Verb = AssignPermissionVerb
            };
        }

        #endregion

        #region "RevokePermission"

        public const string RevokePermission = "/projects/{projectid}/users/{id}/permissions";

        public const string RevokePermissionVerb = "DELETE";

        [Description("RevokePermission")]
        public ServiceEndpointInformation RevokePermissionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = RevokePermission,
                Verb = RevokePermissionVerb
            };
        }

        #endregion

        #region "ListUserPermission"

        public const string ListUserPermission = "/projects/{projectid}/users/{id}/operations";

        public const string ListUserPermissionVerb = "GET";

        [Description("ListUserPermission")]
        public ServiceEndpointInformation ListUserPermissionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListUserPermission,
                Verb = ListUserPermissionVerb
            };
        }

        #endregion

        #endregion

        #region Role / Permission

        #region "ListResource"

        public const string ListResource = "/resources";

        public const string ListResourceVerb = "GET";

        [Description("ListResource")]
        public ServiceEndpointInformation ListResourceInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListResource,
                Verb = ListResourceVerb
            };
        }

        #endregion

        #region "CreateRole"

        public const string CreateRole = "/projects/{projectid}/roles";

        public const string CreateRoleVerb = "POST";

        [Description("CreateRole")]
        public ServiceEndpointInformation CreateRoleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateRole,
                Verb = CreateRoleVerb
            };
        }

        #endregion

        #region "ListRole"

        public const string ListRole = "/projects/{projectid}/roles";

        public const string ListRoleVerb = "GET";

        [Description("ListRole")]
        public ServiceEndpointInformation ListRoleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListRole,
                Verb = ListRoleVerb
            };
        }

        #endregion

        #region "GetRole"

        public const string GetRole = "/projects/{projectid}/roles/{id}";

        public const string GetRoleVerb = "GET";

        [Description("GetRole")]
        public ServiceEndpointInformation GetRoleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetRole,
                Verb = GetRoleVerb
            };
        }

        #endregion

        #region "DeleteRole"

        public const string DeleteRole = "/projects/{projectid}/roles/{id}";

        public const string DeleteRoleVerb = "DELETE";

        [Description("DeleteRole")]
        public ServiceEndpointInformation DeleteRoleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteRole,
                Verb = DeleteRoleVerb
            };
        }

        #endregion

        #region "UpdateRole"

        public const string UpdateRole = "/projects/{projectid}/roles";

        public const string UpdateRoleVerb = "PUT";

        [Description("UpdateRole")]
        public ServiceEndpointInformation UpdateRoleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateRole,
                Verb = UpdateRoleVerb
            };
        }

        #endregion

        #region "ListUserRoleMap"

        public const string ListUserRoleMap = "/users/{id}/roles";

        public const string ListUserRoleMapVerb = "GET";

        [Description("ListUserRoleMap")]
        public ServiceEndpointInformation ListUserRoleMapInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListUserRoleMap,
                Verb = ListUserRoleMapVerb
            };
        }

        #endregion

        #region "ListRolePermission"

        public const string ListRolePermission = "/projects/{projectid}/roles/{id}/permissions";

        public const string ListRolePermissionVerb = "GET";

        [Description("ListRolePermission")]
        public ServiceEndpointInformation ListRolePermissionInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListRolePermission,
                Verb = ListRolePermissionVerb
            };
        }

        #endregion

        #region "AddPermissionToRole"

        public const string AddPermissionToRole = "/projects/{projectid}/roles/{id}/permissions";

        public const string AddPermissionToRoleVerb = "POST";

        [Description("AddPermissionToRole")]
        public ServiceEndpointInformation AddPermissionToRoleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = AddPermissionToRole,
                Verb = AddPermissionToRoleVerb
            };
        }

        #endregion

        #region "AssignRole"

        public const string AssignRole = "/projects/{projectid}/users/{id}/roles/{id}";

        public const string AssignRoleVerb = "POST";

        [Description("AssignRole")]
        public ServiceEndpointInformation AssignRoleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = AssignRole,
                Verb = AssignRoleVerb
            };
        }

        #endregion

        #region "RevokeRole"

        public const string RevokeRole = "/projects/{projectid}/users/{id}/roles/{id}";

        public const string RevokeRoleVerb = "DELETE";

        [Description("RevokeRole")]
        public ServiceEndpointInformation RevokeRoleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = RevokeRole,
                Verb = RevokeRoleVerb
            };
        }

        #endregion

        #region "RemovePermissionFromRole"

        public const string RemovePermissionFromRole = "/projects/{projectid}/roles/{id}/permissions";

        public const string RemovePermissionFromRoleVerb = "DELETE";

        [Description("RemovePermissionFromRole")]
        public ServiceEndpointInformation RemovePermissionFromRoleInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = RemovePermissionFromRole,
                Verb = RemovePermissionFromRoleVerb
            };
        }

        #endregion

        #endregion

        #region Application

        #region "ListApplication"
        public const string ListApplication = "/projects/{projectid}/applications";
        public const string ListApplicationVerb = "GET";

        [Description("ListApplication")]
        public ServiceEndpointInformation ListApplicationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListApplication,
                Verb = ListApplicationVerb
            };
        }
        #endregion

        #region "GetApplication"

        public const string GetApplication = "/projects/{projectid}/applications/{id}";
        public const string GetApplicationVerb = "GET";

        [Description("GetApplication")]
        public ServiceEndpointInformation GetApplicationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetApplication,
                Verb = GetApplicationVerb
            };
        }
        #endregion

        #region "CreateApplication"
        public const string CreateApplication = "/projects/{projectid}/applications";
        public const string CreateApplicationVerb = "POST";

        [Description("CreateApplication")]
        public ServiceEndpointInformation CreateApplicationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateApplication,
                Verb = CreateApplicationVerb
            };
        }
        #endregion

        #region "UpdateApplication"

        public const string UpdateApplication = "/projects/{projectid}/applications";
        public const string UpdateApplicationVerb = "PUT";

        [Description("UpdateApplication")]
        public ServiceEndpointInformation UpdateApplicationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateApplication,
                Verb = UpdateApplicationVerb
            };
        }
        #endregion

        #region "DeleteApplication"
        public const string DeleteApplication = "/projects/{projectid}/applications/{id}";
        public const string DeleteApplicationVerb = "DELETE";

        [Description("DeleteApplication")]
        public ServiceEndpointInformation DeleteApplicationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteApplication,
                Verb = DeleteApplicationVerb
            };
        }
        #endregion

        #endregion

        #region Installation

        #region "ListInstallation"
        public const string ListInstallation = "/projects/{projectid}/applications/{applicationId}/installations";
        public const string ListInstallationVerb = "GET";

        [Description("ListInstallation")]
        public ServiceEndpointInformation ListInstallationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = ListInstallation,
                Verb = ListInstallationVerb
            };
        }
        #endregion

        #region "GetInstallation"

        public const string GetInstallation = "/projects/{projectid}/applications/{applicationId}/installations/{installationId}";
        public const string GetInstallationVerb = "GET";

        [Description("GetInstallation")]
        public ServiceEndpointInformation GetInstallationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = GetInstallation,
                Verb = GetInstallationVerb
            };
        }
        #endregion

        #region "CreateInstallation"
        public const string CreateInstallation = "/projects/{projectid}/applications/{applicationId}/installations";
        public const string CreateInstallationVerb = "POST";

        [Description("CreateInstallation")]
        public ServiceEndpointInformation CreateInstallationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = CreateInstallation,
                Verb = CreateInstallationVerb
            };
        }
        #endregion

        #region "UpdateInstallation"

        public const string UpdateInstallation = "/projects/{projectid}/applications/{applicationId}/installations";
        public const string UpdateInstallationVerb = "PUT";

        [Description("UpdateInstallation")]
        public ServiceEndpointInformation UpdateInstallationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = UpdateInstallation,
                Verb = UpdateInstallationVerb
            };
        }
        #endregion

        #region "DeleteInstallation"
        public const string DeleteInstallation = "/projects/{projectid}/applications/{applicationId}/installations/{installationId}";
        public const string DeleteInstallationVerb = "DELETE";

        [Description("DeleteInstallation")]
        public ServiceEndpointInformation DeleteInstallationInformation()
        {
            return new ServiceEndpointInformation()
            {
                Endpoint = DeleteInstallation,
                Verb = DeleteInstallationVerb
            };
        }
        #endregion

        #endregion
    }
}
