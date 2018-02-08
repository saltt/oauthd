var me = {
  url: "https://graph.microsoft.com/v1.0/me",
  params: {},
  fields: {
      display_name: function(me) {
          return me.displayName;
      },
      id: function(me) {
          return me.id;
      },
      email: function(me) {
          return me.userPrincipalName;
      },
      entity: function(me) {
          return me['@odata.context'];
      }
  }
};
module.exports = me;
