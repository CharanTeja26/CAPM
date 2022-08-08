const cds = require('@sap/cds')
module.exports = function (){
this.before(['CREATE', 'UPDATE'], 'ContactAddressBook', async (req) => {
    req.data.FIRST_NAME1 = req.data.FIRST_NAME
    
} );

}