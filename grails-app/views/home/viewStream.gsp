<%--
  Created by IntelliJ IDEA.
  User: sajal
  Date: 24/12/18
  Time: 3:26 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>View Live Stream</title>
    <meta name="layout" content="homeLayout">
    <script type="text/javascript" src="//player.wowza.com/player/latest/wowzaplayer.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12 text-center">
            <h4>Stream of ${user.firstName} ${user.lastName}</h4>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="playerElement" style="width:100%; height:0; padding:0 0 56.25% 0"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
    WowzaPlayer.create('playerElement', {
            "license":"${grailsApplication.config.wowza.license}",
            "title":"Live Stream",
            "description":"Live Stream of ${user.firstName} ${user.lastName}",
            "sourceURL":"${user.streamURL}",
            "autoPlay":true,
            "volume":"75",
            "mute":false,
            "loop":false,
            "audioOnly":false,
            "uiShowQuickRewind":true,
            "uiQuickRewindSeconds":"30"
        }
    );
</script>
</body>
</html>