<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Example Page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>

		$(document).ready(function() {
		    function getUrlParameter(name) {
		        name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
		        var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
		        var results = regex.exec(location.search);
		        return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
		    }

		    // 獲取 chatId 參數值（注意大小寫）
		    var chatId = getUrlParameter('chatId');

		    // 如果 chatId 有值，將其放入 rechatid 和 authcode 欄位
		    if (chatId) {
		        $('#rechatid').val(chatId);
		    }
		});
	</script>
</head>
<body>
    <h1>模擬登入畫面</h1>

    <!-- 表單讓使用者輸入 rechatid 和 authcode -->
    <label for="rechatid">Rechat ID(非必要不用更改):</label>
    <input type="text" id="rechatid" name="rechatid"><br><br>

    <label for="authcode">Auth Code(請輸入模擬用authcode 勿留空):</label>
    <input type="text" id="authcode" name="authcode"><br><br>

    <button id="sendRequestButton">發送請求</button>

    <!-- 隱藏的表單 -->
    <form id="postForm" action="http://localhost:8080/Webhook/" method="POST" target="_blank" style="display: none;">
        <input type="hidden" id="authcodeField" name="authcode" value="">
    </form>

    <script>
        document.getElementById('sendRequestButton').addEventListener('click', function() {
            // 取得使用者輸入的 rechatid 和 authcode
            const rechatid = document.getElementById('rechatid').value;
            const authcode = document.getElementById('authcode').value;

            // 設定隱藏表單中的 authcode 值
            document.getElementById('authcodeField').value = authcode;

            // 設定表單 action 包含 rechatid 作為 query string
            const form = document.getElementById('postForm');
            form.action = 'http://localhost:8080/Webhook/?chatId=' + rechatid;

            // 提交隱藏的表單
            form.submit();
        });
    </script>
</body>
</html>