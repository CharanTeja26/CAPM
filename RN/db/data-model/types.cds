namespace charan.types;

using {
    managed,
    sap
} from '@sap/cds/common';

type DocKeyT : String(32);
type AppKeyT : String(32);
type DescT : String(100);
type StatusT : Decimal(4, 0);
type UserT : String(256);
type LineNoT : Decimal(4, 0);
type LongDataT : String(200);
type AppIdT : String(40);
type LongDescT : String(220);
type RNEntityKeyT : Integer;
type EmailT : String(320);


type HistoryT {

    @readonly
    @cds.on.insert : $user
    CRTD_BY     : UserT;

    @readonly
    @cds.on.insert : $now
    CRTD_DATE   : DateTime;

    CRTD_APP_ID : AppIdT;

    @readonly
    @cds.on.insert : $user
    @cds.on.update : $user
    CHNG_BY     : UserT;

    @readonly
    @cds.on.insert : $now
    @cds.on.update : $now
    CHNG_DATE   : DateTime;

    CHNG_APP_ID : AppIdT;
};


type Currency : Association to sap.common.Currencies;
type COUNTRY : Association to sap.common.Countries;