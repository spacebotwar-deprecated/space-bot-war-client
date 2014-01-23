define([

],
function(

) {
    function Session() {
        var self = this;

        self.clientCode = localStorage.clientCode;

        self.getClientCode = function() {
            return self.clientCode;
        };

        self.setClientCode = function(newClientCode) {
            if (newClientCode) {
                localStorage.clientCode = newClientCode;
                self.clientCode = newClientCode;
            }
        };
    }

    return new Session();
});
