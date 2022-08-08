using sap.capire.sample as sample from '../db/schema';

service CatalogService {
    @odata.draft.enabled
    entity ContactAddressBook as projection on sample.CONTACT_ADDRESS_BOOK;
    }