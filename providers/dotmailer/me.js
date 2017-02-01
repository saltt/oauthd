var me = {
    url: "/account-info",
    params: {},
    fields: {
        apiEndpoint: function(me) {
            findValueByName(me.properties, "ApiEndpoint")
        },
        name: function(me) {
            findValueByName(me.properties, "Name")
        },
        email: function(me) {
            findValueByName(me.properties, "MainEmail")
        },
        id: function(me) {
            me.id
        },
    }
};

function findValueByName(array, name) {
  var prop = array.find(function(obj){
    return obj.name === name;
  });

  return prop.value;
};

module.exports = me;
