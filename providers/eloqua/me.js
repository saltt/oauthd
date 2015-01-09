var me = {
    url: "https://login.eloqua.com/id",
    params: {},
    fields: {
        name: function(me) {
            return me.user.displayName;
        },
        firstname: function(me) {
            return me.user.firstName;
        },
        lastname: function(me) {
            return me.user.lasttName;
        },
        email: function(me) {
            return me.user.emailAddress
        },
        baseUrl: function(me) {
            return me.urls.base;
        },
        apis: function(me) {
            return me.urls.apis;
        },
        urls: function(me) {
            return me.urls
        },
        locale: 'language'
    }
};
module.exports = me;
