<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        ImageResizer.Configuration.Config.Current.Plugins.LoadPlugins();
        ImageResizer.Configuration.Config.Current.Pipeline.Rewrite += Pipeline_Rewrite;
    }

    void Pipeline_Rewrite(IHttpModule sender, HttpContext context, ImageResizer.Configuration.IUrlEventArgs e)
    {
        if (e.QueryString["scache"] == null) e.QueryString["scache"] = "disk";
        
        if (e.VirtualPath.StartsWith("/rw/", StringComparison.OrdinalIgnoreCase)) e.VirtualPath = "/s3/resizer-web" + e.VirtualPath.Substring(3);
        if (e.VirtualPath.StartsWith("/ri/", StringComparison.OrdinalIgnoreCase)) e.VirtualPath = "/s3/resizer-images" + e.VirtualPath.Substring(3);
        
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
