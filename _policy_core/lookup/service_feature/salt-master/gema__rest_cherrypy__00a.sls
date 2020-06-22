##
##
##



##_META
##



## <JINJA>
## </JINJA>



# notes on Implementation Status
{#
---
A REST API for Salt

depends

        CherryPy Python module.

        Note: there is a known SSL traceback for CherryPy versions 3.2.5 through 3.7.x. Please use version 3.2.3 or the latest 10.x version instead.

optdepends

        ws4py Python module for websockets support.

client_libraries

        Java: https://github.com/SUSE/salt-netapi-client

        Python: https://github.com/saltstack/pepper

setup

    All steps below are performed on the machine running the Salt Master daemon. Configuration goes into the Master configuration file.

        Install salt-api. (This step varies between OS and Linux distros. Some package systems have a split package, others include salt-api in the main Salt package. Ensure the salt-api --version output matches the salt --version output.)

        Install CherryPy. (Read the version caveat in the section above.)

        Optional: generate self-signed SSL certificates.

        Using a secure HTTPS connection is strongly recommended since Salt eauth authentication credentials will be sent over the wire.

            Install the PyOpenSSL package.

            Generate a self-signed certificate using the create_self_signed_cert() execution function.

            salt-call --local tls.create_self_signed_cert

        Edit the master config to create at least one external auth user or group following the full external auth instructions.

        Edit the master config with the following production-ready example to enable the rest_cherrypy module. (Adjust cert paths as needed, or disable SSL (not recommended!).)

        rest_cherrypy:
          port: 8000
          ssl_crt: /etc/pki/tls/certs/localhost.crt
          ssl_key: /etc/pki/tls/certs/localhost.key

        Restart the salt-master daemon.

        Start the salt-api daemon.

---
configuration

    All available configuration options are detailed below. These settings configure the CherryPy HTTP server and do not apply when using an external server such as Apache or Nginx.

    port

        Required

        The port for the webserver to listen on.
    host0.0.0.0

        The socket interface for the HTTP server to listen on.
    debugFalse

        Starts the web server in development mode. It will reload itself when the underlying code is changed and will output more debugging info.
    log_access_file

        Path to a file to write HTTP access logs.

        New in version 2016.11.0.
    log_error_file

        Path to a file to write HTTP error logs.

        New in version 2016.11.0.
    ssl_crt

        The path to a SSL certificate. (See below)
    ssl_key

        The path to the private key for your SSL certificate. (See below)
    ssl_chain

        (Optional when using PyOpenSSL) the certificate chain to pass to Context.load_verify_locations.
    disable_ssl

        A flag to disable SSL. Warning: your Salt authentication credentials will be sent in the clear!
    webhook_disable_authFalse

        The Webhook URL requires authentication by default but external services cannot always be configured to send authentication. See the Webhook documentation for suggestions on securing this interface.
    webhook_url/hook

        Configure the URL endpoint for the Webhook entry point.
    thread_pool100

        The number of worker threads to start up in the pool.
    socket_queue_size30

        Specify the maximum number of HTTP connections to queue.
    expire_responsesTrue

        Whether to check for and kill HTTP responses that have exceeded the default timeout.

        Deprecated since version 2016.11.9,2017.7.3,2018.3.0: The "expire_responses" configuration setting, which corresponds to the timeout_monitor setting in CherryPy, is no longer supported in CherryPy versions >= 12.0.0.
    max_request_body_size1048576

        Maximum size for the HTTP request body.
    collect_statsFalse

        Collect and report statistics about the CherryPy server

        Reports are available via the Stats URL.
    stats_disable_authFalse

        Do not require authentication to access the /stats endpoint.

        New in version 2018.3.0.
    static

        A filesystem path to static HTML/JavaScript/CSS/image assets.
    static_path/static

        The URL prefix to use when serving static assets out of the directory specified in the static setting.
    enable_sessionsTrue

        Enable or disable all endpoints that rely on session cookies. This can be useful to enforce only header-based authentication.

        New in version 2017.7.0.
    appindex.html

        A filesystem path to an HTML file that will be served as a static file. This is useful for bootstrapping a single-page JavaScript app.

        Warning! If you set this option to a custom web application, anything that uses cookie-based authentication is vulnerable to XSRF attacks. Send the custom X-Auth-Token header instead and consider disabling the enable_sessions setting.

        Changed in version 2017.7.0: Add a proof-of-concept JavaScript single-page app.
    app_path/app

        The URL prefix to use for serving the HTML file specified in the app setting. This should be a simple name containing no slashes.

        Any path information after the specified path is ignored; this is useful for apps that utilize the HTML5 history API.
    root_prefix/

        A URL path to the main entry point for the application. This is useful for serving multiple applications from the same URL.


#}



# create ssl certs
lookup:
  sls_path:
    - state._.pillar-splat:
        stanza_dct:
          "f30e533e-2e4c-4ff0-a79c-fa07b3de654c":
            pkg.installed:
              - pkgs:
                - pyOpenSSL
                - python36-pyOpenSSL
                - salt-api
          "64d86321-415b-461a-9f78-727b1c7ca650"
            module.run:
              - tls.create_self_signed_cert: []



# enable salt-api (tornado) via the salt-formula
salt:
  master:
    rest_cherrypy:
      port: 8000
      ssl_crt: /etc/pki/tls/certs/localhost.crt
      ssl_key: /etc/pki/tls/certs/localhost.key
      disable_ssl: False
      webhook_disable_auth: False
      cors_origin: null



## EOF
