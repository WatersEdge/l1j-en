sendRequest.README={license:'Public Domain',url:'http://jsgt.org/lib/ajax/ref.htm',version:0.516,author:'Toshiro Takahashi'};function chkAjaBrowser(){var A,B=navigator.userAgent;this.bw={safari:((A=B.split('AppleWebKit/')[1])?A.split('(')[0].split('.')[0]:0)>=124,konqueror:((A=B.split('Konqueror/')[1])?A.split(';')[0]:0)>=3.3,mozes:((A=B.split('Gecko/')[1])?A.split(' ')[0]:0)>=20011128,opera:(!!window.opera)&&((typeof XMLHttpRequest)=='function'),msie:(!!window.ActiveXObject)?(!!createHttpRequest()):false};return(this.bw.safari||this.bw.konqueror||this.bw.mozes||this.bw.opera||this.bw.msie)}function createHttpRequest(){if(window.XMLHttpRequest){return new XMLHttpRequest()}else{if(window.ActiveXObject){try{return new ActiveXObject('Msxml2.XMLHTTP')}catch(B){try{return new ActiveXObject('Microsoft.XMLHTTP')}catch(A){return null}}}else{return null}}};function sendRequest(E,R,C,D,F,G,S,A){var Q=C.toUpperCase()=='GET',H=createHttpRequest();if(H==null){return null}if((G)?G:false){D+=((D.indexOf('?')==-1)?'?':'&')+'t='+(new Date()).getTime()}var P=new chkAjaBrowser(),L=P.bw.opera,I=P.bw.safari,N=P.bw.konqueror,M=P.bw.mozes;if(typeof E=='object'){var J=E.onload;var O=E.onbeforsetheader}else{var J=E;var O=null}if(L||I||M){H.onload=function(){J(H);H.abort()}}else{H.onreadystatechange=function(){if(H.readyState==4){J(H);H.abort()}}}R=K(R,D);if(Q){D+=((D.indexOf('?')==-1)?'?':(R=='')?'':'&')+R}H.open(C,D,F,S,A);if(!!O){O(H)}B(H);H.send(R);function B(T){if(!L||typeof T.setRequestHeader=='function'){T.setRequestHeader('Content-Type','application/x-www-form-urlencoded; charset=UTF-8')}return T}function K(X,V){var Z=[];if(typeof X=='object'){for(var W in X){Y(W,X[W])}}else{if(typeof X=='string'){if(X==''){return''}if(X.charAt(0)=='&'){X=X.substring(1,X.length)}var T=X.split('&');for(var W=0;W<T.length;W++){var U=T[W].split('=');Y(U[0],U[1])}}}function Y(b,a){Z.push(encodeURIComponent(b)+'='+encodeURIComponent(a))}return Z.join('&')}return H}