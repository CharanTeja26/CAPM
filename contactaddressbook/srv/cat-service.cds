using {sap.CONTACTADDRESSBOOK as my} from '../db/data-model';

service CatalogService {
    @odata.draft.enabled
    entity ContactAddressBook as projection on my.CONTACT_ADDRESS_BOOK{
        *,
        //LINK_TO_GENDERS     : redirected to Genders,
        //LINK_TO_COUNTRY     : redirected to Nationality,
    };
    //action ChangeTemplateID();
    // @odata.draft.enabled
    entity Genders as projection on my.GENDERS{
        *
    };

}