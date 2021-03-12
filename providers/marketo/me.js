var me = {
    url: "https://446-STX-732.mktorest.com/me",
    params: {},
    fields: {
        id: function(me) {
            return me.id;
        },
        email: function(me) {
            return me.email;
        },
        type: function(me) {
            return me.type;
        },
        name: function(me) {
            return me.name;
        },
        app: function(me) {
            return me.app;
        },
        avatar: function(me) {
            return me.avatar;
        }
    }
}

module.exports = me;
