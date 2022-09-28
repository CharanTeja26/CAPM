using charan as charan from '../db/data-model/data-model';
using charan.types as types from '../db/data-model/types';
using views as views from '../db/data-model/views';

service CatalogService @(requires: 'authenticated-user'){
entity RegulatoryNoticeRequestHeader       as projection on views.SMART_REGULATORY_NOTICE_MASTER;
    entity RegulatoryNoticeSuppliers           as projection on views.REGULATORY_NOTICE_SUPPLIERS;
    entity MidOfficeOwners                     as projection on charan.MID_OFFICE_OWNERS;
    entity LeadSpendCategory                   as projection on charan.LEAD_SPEND_CATEGORY_T;
    entity LeadSpendMatGroup                   as projection on charan.LEAD_SPEND_MAT_GROUP_T;
    entity RNCollectionWave                    as projection on charan.REGULATORY_NOTICE_COLLECTION_WAVE_T;
    entity RNStatuses as projection on charan.C_REGULATORY_STATUSES {
    	*
    };

}