var me = {
    url: "/primarycontact.json",
    params: {},
    fields: {
        email: function(me) {
            return me.EmailAddress;
        }
    }
};

module.exports = me;
