$(function(){
		console.log("SummerNote!");
				 $('#summernote').summernote({
				        placeholder: '글을 입력하세요.',
				        tabsize: 2,
				        height: 400,
				        width: '100%',
				        toolbar: [
				          ['style', ['style']],
				          ['font', ['bold', 'underline', 'clear']],
				          ['color', ['color']],
				          ['para', ['ul', 'ol', 'paragraph']],
				          ['table', ['table']],
				          ['insert', ['link', 'picture', 'video']],
				          ['view', ['fullscreen', 'codeview', 'help']]
				        ],
				        callbacks: {
				        	onImageUpload: fileUpload
				        }
				      });
			})
			
			//썸머노트에 이미지업로드가 발생하였을 때 동작하는 함수
			function fileUpload(files){
				console.log("파일 : " + files)

				const fd = new FormData();
				for(let file of files) {
					fd.append("fileList", file);
					console.log("파일 : " + file)
				}
				
				insertFile(fd, function(nameList){
					for(let name of nameList){
						console.log("INSERTFILE FUNCTION");
						$("#summernote").summernote("insertImage", "/resources/images/boardFile/" + name);
					}
				})
			}
			
			function insertImage(data, callback){
				
				$.ajax({
					url: "uploadFileSum.bd",
					type: "POST",
					data: data,
					processData: false, //기본이 true -> 전송하는 data를 string으로 변환해서 요청
					contentType: false, //
					dataType: "json", //받을 때 타입 
					success: function(res){
						callback(res)
					},
					error: function(){
						console.log("파일업로드 api요청 실패")
					} 
				})
			}