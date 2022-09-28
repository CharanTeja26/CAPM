namespace charan;

using charan.types as types from '../data-model/types';
using views as views from '../data-model/views';

 entity REGULATORY_NOTICE_REQUEST_HEADER {
    key RN_UUID                            : UUID;
    key RN_ID                              : types.RNEntityKeyT;
        RN_COLLECTION_WAVE                 : String(10);
        RN_SIGNOFF_STATUS                  : types.StatusT;
        RN_SENT_OUT                        : Boolean;
        RN_SENT_OUT_DATE                   : Date;
        RN_SIGN_DATE                       : Date;
        RN_TARGET_DEADLINE_DATE            : Date;
        MO_OWNER                           : String(256);
        ANNUAL_SPEND_VALUE_AMOUNT          : Decimal(10, 2);
        ANNUAL_SPEND_VALUE_CURRENCY        : types.Currency;
        LEAD_SPEND_CATEGORY                : types.DescT;
        LEAD_SPEND_MAT_GROUP               : types.DescT;
        SUPPLIER_GROUP_CODE                : String(18);
        MOO_ID                             : Integer;
        HISTORY                            : types.HistoryT;
        LINK_TO_MID_OFFICE_OWNER           : Association[1..1] to MID_OFFICE_OWNERS
                                                 on LINK_TO_MID_OFFICE_OWNER.MOO_ID = MOO_ID;
        LINK_TO_STATUS                     : Association[1..1] to C_REGULATORY_STATUSES
                                                 on LINK_TO_STATUS.ID = RN_SIGNOFF_STATUS;
        LINK_TO_SUPP_GROUP_MASTER          : Association[1..1] to RN_SUPPLIER_GROUP_MASTER_DATA
                                                 on LINK_TO_SUPP_GROUP_MASTER.SUPPLIERGROUPCODE = SUPPLIER_GROUP_CODE;
        LINK_TO_SUPPLIERGROUPS            : Association[1..1] to SUPPLIERGROUPS
                                                 on LINK_TO_SUPPLIERGROUPS.YSGROUP = SUPPLIER_GROUP_CODE;
        LINK_TO_LEAD_SPEND_CATEGORY        : Association[1..1] to LEAD_SPEND_CATEGORY_T
                                                 on LINK_TO_LEAD_SPEND_CATEGORY.LEAD_SPEND_CATEGORY = LEAD_SPEND_CATEGORY;
        LINK_TO_LEAD_SPEND_MAT_GROUP       : Association[1..1] to LEAD_SPEND_MAT_GROUP_T
                                                 on LINK_TO_LEAD_SPEND_MAT_GROUP.LEAD_SPEND_MAT_GROUP = LEAD_SPEND_MAT_GROUP;
        LINK_TO_REG_NOTICE_COLLECTION_WAVE : Association[1..1] to REGULATORY_NOTICE_COLLECTION_WAVE_T
                                                 on LINK_TO_REG_NOTICE_COLLECTION_WAVE.RN_COLLECTION_WAVE = RN_COLLECTION_WAVE;
}

entity MID_OFFICE_OWNERS {
    key ID                                 : UUID;
    key MOO_ID                             : Integer;
        EMAIL                              : types.EmailT;
        NAME                               : types.UserT;
        TYPE                               : types.AppKeyT;
        LINK_TO_SUPPLIER_GROUPS_GBS_OWNERS : Association[1.. * ] to SUPPLIER_GROUPS_GBS_OWNERS
                                                 on LINK_TO_SUPPLIER_GROUPS_GBS_OWNERS.OWNER_EMAIL = EMAIL;
}

entity SUPPLIER_GROUPS_GBS_OWNERS {
    key SUPPLIER_GROUP_CODE     : String(18);
    key OWNER_EMAIL             : types.UserT;
        DEFAULT_OWNER           : Boolean;
}

entity C_REGULATORY_STATUSES {
    key ID          : types.StatusT;
    APP_NAME        : String(64);
    DESCRIPTION     : localized types.DescT;
}

entity RN_SUPPLIER_GROUP_MASTER_DATA {
    @UI.Hidden:true
    key ID                      : UUID;
   
    @title : 'Supplier Group Code'
    key SUPPLIERGROUPCODE       : String(30);
    @title : 'Supplier Contact Name'
        SUPPLIERCONTACTNAME     : types.UserT;
    @title : 'Supplier Contact Mail'
        SUPPLIEREMAIL           : types.EmailT;
    @title : 'Supplier Contact Number'
        SUPPLIERPHONE           : String(20);
    @title : 'FP Supplier Name'
        FPSUPPLIERNAME          : types.UserT;
    @title : 'FP Supplier Mail'
        FPSUPPLIEREMAIL         : types.EmailT;
    @title : '3PM Supplier Name'
        SUPPLIERNAME_3PM        : types.UserT;
    @title : '3PM Supplier Mail'
        SUPPLIEREMAIL_3PM       : types.EmailT;
    @UI.HiddenFilter:true
        LINK_TO_SUPPLIERGROUPS : Association[1..1] to SUPPLIERGROUPS
                                      on LINK_TO_SUPPLIERGROUPS.YSGROUP = SUPPLIERGROUPCODE;
}

entity SUPPLIERGROUPS {
    key YSGROUP : String(30);
        @title : 'Supplier Group Name'
        YSGRTXT : String(60);
}

entity LEAD_SPEND_CATEGORY_T {
    key ID                  : UUID;
        LEAD_SPEND_CATEGORY : types.DescT;
}

entity LEAD_SPEND_MAT_GROUP_T {
    key ID                   : UUID;
        LEAD_SPEND_MAT_GROUP : types.DescT;
}

entity REGULATORY_NOTICE_COLLECTION_WAVE_T {
    key ID                 : UUID;
        RN_COLLECTION_WAVE : String(50);
}