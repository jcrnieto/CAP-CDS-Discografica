const cds = require('@sap/cds');
const {JWTStrategy} = require("@sap/xssec");
const passport = require("passport");
const xsenv = require("@sap/xsenv");

cds.on('bootstrap', async app => {

    try {
        await cds.connect.to('db');
        passport.use(new JWTStrategy(xsenv.getServices({'uaa': {tag: "xsuaa"}}).uaa));
        app.use(passport.initialize());
        app.use(passport.authenticate("JWT", { session: false}));
    
        console.log('Conexión a la base de datos exitosa');
      } catch (err) {
        console.error('Error al conectar a la base de datos', err);
      }

    // passport.use(new JWTStrategy(xsenv.getServices({'uaa': {tag: "xsuaa"}}).uaa));
    // app.use(passport.initialize());
    // app.use(passport.authenticate("JWT", { session: false}));

   

    // Aquí puedes agregar tus rutas personalizadas o middleware adicional
});

module.exports = cds.server;