<!DOCTYPE html>
<html>
<head>
  <title>SkylinkJS</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="./favicon.ico">
  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" media="screen">
  <link href="http://cdnjs.cloudflare.com/ajax/libs/prettify/r224/prettify.css" type="text/css">
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.0/jquery.min.js" type="text/javascript"></script>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/prettify/r224/prettify.js" type="text/javascript"></script>
  <style>
  .row-eq-height {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
  }
    .table {
      font-size:12px;
    }
    .table th {
      font-size:14px;
    }
  </style>
</head>
<body>
<g:form controller="crisis" action="doSearchCrisis" method="post">
    <input id="rechercher"  type="text"  name="stringToSearch" placeholder="Tapez votre recherche..." />
    <g:actionSubmit  controller="crisis" action="doSearchCrisis" value="Rechercher"/>
</g:form>
<div>
  <div class="page">
    <div class="container-fluid">
      <div class="page-header">
        <h2><a href="http://temasys.github.io/"><img class="img-responsive" src="images/skylinkjs.svg" alt="Skylink JS" height="120px"; width="135px"></a></h2>
         <small>Client API Documentation</small></h1>
      </div>
      <div class="col-md-4 panel panel-default">
        <div class="panel-heading">
          <h4>Chat room</h4>
        </div>
        <div class="panel-body">
          <p>
          <em>This demo presents an IRC like chat powered by SkylinkJS.</em>
        </p>
        <hr>
        <ul>
          <li>Automatically connects to default Room</li>
          <li>Handle connection and disconnection of peers</li>
        </ul>
        <div class="panel panel-info">
            <div class="panel-heading">Difficulty</div>
            <div class="progress" style="height:20px;margin:5px;">
              <div class="progress-bar progress-bar-success"
                role="progressbar" aria-valuenow="2" aria-valuemin="0" aria-valuemax="10" style="width:30%;">
                Easy
              </div>
            </div>
          </div>
        <p>
          <a href="static/st/chat-room/index.html" class="btn btn-primary">View Demo</a>
        </p>
        </div>
      </div>
      </div>
    </div>
  </div>
</body>
</html>
