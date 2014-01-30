var LoginRadiusSDK = function () {
    console.log("login-radius:");
    var a = {
        isauthenticated: false,
        onlogin: function () {
            console.log("login-radius: ERROR. IN ONLOGIN");
        },

        getUserprofile: function (c) {b.jsonpCall("https://hub.loginradius.com/UserProfile/" + a.getToken(), function (a) {c(a)})},
        
        getUsercontact: function (c) {b.jsonpCall("https://hub.loginradius.com/contacts/" + a.getToken(), function (a) {c(a)})},

        getEvents: function (c) { b.jsonpCall("https://hub.loginradius.com/GetEvents/" + a.getToken(), function (a) { c(a) }) },

        getPosts: function (c) { b.jsonpCall("https://hub.loginradius.com/GetPosts/" + a.getToken(), function (a) { c(a) }) },//Change

        getGroups: function (c) { b.jsonpCall("https://hub.loginradius.com/GetGroups/" + a.getToken(), function (a) { c(a) }) },

        getCompanies: function (c) { b.jsonpCall("https://hub.loginradius.com/GetCompany/" + a.getToken(), function (a) { c(a) }) },//Change

        getMentions: function (c) { b.jsonpCall("https://hub.loginradius.com/status/mentions/" + a.getToken(), function (a) { c(a) }) }, //Change

        senddirectmessage: function (c, d, f, e) { b.jsonpCall("https://hub.loginradius.com/directmessage/" + a.getToken() + "?sendto=" + c + "&subject=" + d + "&message=" + f, function (a) { e(a) }) },

        updatestatus: function (e, g, f, h, i, j, c) { 
            console.log("login-radius: updatestatus");
            b.jsonpCall("https://hub.loginradius.com/status/update/" + a.getToken() + "?to=&title=" + e + "&url=" + g + "&imageurl=" + f + "&status=" + h + "&caption=" + i + "&description=" + j, function (a) { c(a) }) }}, 
        b = {
        jsonpCall: function (c, d) {
            console.log("login-radius: jsunpCall");
            var a = "Loginradius" + Math.floor(1e18 * Math.random() + 1);
            window[a] = function (c) {
                d(c);
                try {
                    delete window[a]
                } catch (e) {
                    window[a] = void 0
                }
                document.body.removeChild(b)
            };
            var b = document.createElement("script");
            b.src = -1 != c.indexOf("?") ? c + "&callback=" + a : c + "?callback=" + a;
            b.type = "text/javascript";
            document.body.appendChild(b)
        },
        addEvent: function (c, b, d) {
            console.log("login-radius: addEvent");
            var a = [];
            b instanceof Array ? a = b : a.push(b);
            for (i = 0; i < a.length; i++) a[i].attachEvent ? a[i].attachEvent("on" + c, function (a) {
                d(a)
            }) : a[i].addEventListener && a[i].addEventListener(c, d, false)
        }
    };
    console.log("login-radius: about to do a() b()");
    a.getToken = function () {return sessionStorage.getItem("LRTokenKey")};
    b.addEvent("message", window, function (b) {-1 != b.origin.indexOf("hub.loginradius.com") && (sessionStorage.setItem("LRTokenKey", b.data), a.isauthenticated = true, a.onlogin())});
    return a
} ()
