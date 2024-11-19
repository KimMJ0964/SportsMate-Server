
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
			console.log(files)
			//썸머노트는 이미지를 추가하면 해당 이미지파일을 전달해준다.
			//callbacks에 onImageUpload를 작성하지 않을경우 자동으로 이미지를 string으로 변환하여 준다.
			//callbacks에 onImageUpload를 작성할 경우 해당 이미지 경로를 직접 작성해 주어야 한다.
			
			//파일업로드 할 때는 form태그에서 encType을 multipart/form-data형식으로
			//요청했던 것처럼 js객체에 FormData객체를 이용해서 ajax요청을 전달해준다.
			
			const fd = new FormData();
			for(let file of files) {
				fd.append("fileList", file);
			}
			
			insertFile(fd, function(nameList){
				for(let name of nameList){
					$("#summernote").summernote("insertImage", "/resources/images/boardFile/" + name);
				}
			})
		}
		
		function insertFile(data, callback){
			
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