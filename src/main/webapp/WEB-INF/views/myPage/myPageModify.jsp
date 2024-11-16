<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberEnrollForm.css">
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/myPage/myInfoModify.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>SportsMate - 회원가입</title>
</head>
<body>
    <div class="wrap">
        <jsp:include page="../common/header.jsp"/>
        <div id="enroll-wrap">
            <form action="modifyMyInfo.mp" class="enroll-form" method="post" enctype="multipart/form-data">
                <div class="user-profile-wrap">
                    <img src="${pageContext.request.contextPath}/resources/images/user_default_profile.png" alt="" id="profileImg">
                    <input type="file" name="userProfile" id="userProfile" style="display: none">
                </div>
                <div class="input-wrap">
                    <span class="form-title">이메일</span> <br>
                    <input type="email" name="memEmail" placeholder="이메일을 입력해주세요." value="${member.memEmail }" readonly="readonly">
                    <span id="emailCheckResult" class="hide"></span>
                </div>
                <div class="input-wrap">
                    <span class="form-title">이름</span><br>
                    <input type="text" name="memName" placeholder="이름을 입력해주세요." value="${member.memName }">
                </div>
               <div class="input-wrap">
				    <span class="form-title">성별</span><br>
				    <select name="memGender" readonly>
					    <option disabled hidden>성별</option>
					    <option value="M" ${member.memGender == 'M' ? 'selected' : ''}>남자</option>
					    <option value="F" ${member.memGender == 'F' ? 'selected' : ''}>여자</option>
					</select>
				</div>
                <div id="modify-birth-num" class="input-wrap" data-birth="${member.memBirth }">
                    <span class="form-title">생년월일</span><br>
                    <div class="birth-wrap">
                        <div class="year-wrap">
                            <select name="year" id="year"></select>
                        </div>
                        <div class="month-wrap">
                            <select name="month" id="month"></select>
                        </div>
                        <div class="day-wrap">
                            <select name="day" id="day"></select>
                        </div>
                    </div>
                </div>
                <div id="modify-phone-num" class="input-wrap" data-phone="${member.memPhone }">
                    <span class="form-title">핸드폰 번호</span><br>
                    <div class="birth-wrap">
                        <div class="year-wrap">
                            <select name="phone1" id="phone1">
                                <option value="010">010</option>
                            </select>
                        </div>
                        <div class="month-wrap">
                            <input type="number" name="phone2" id="phone2"
                                   oninput="this.value = this.value.slice(0, 4)">
                        </div>
                        <div class="day-wrap">
                            <input type="number" name="phone3" id="phone3"
                                   oninput="this.value = this.value.slice(0, 4)">
                        </div>
                    </div>
                </div>
                <div class="input-wrap">
                    <span class="form-title">주소</span> <br>
                    <div class="address-container" id="modify-add" data-add="${member.memAdd }">
                        <input type="text" class="zipcode" id="zipcode" name="memberZipcode" placeholder="우편번호" value="${member.memZipcode }" >
                        <button type="button" class="address-search-button"
                                onclick="addSearch('zipcode','baseAdd', 'detailAdd')">주소 검색
                        </button>
                    </div>
                    <input type="text" class="basic-address" id="baseAdd" name="memberBaseAdd" placeholder="기본 주소">
                    <input type="text" class="detail-address" id="detailAdd" name="memberDetailAdd" placeholder="상세 주소">
                </div>
                <div class="split-bar"></div>
                <div class="input-wrap">
                    <div class="category-checkBox-wrap">
                        <div class="category-checkBox">
                            <input type="checkbox" name="category" id="soccer" value="soccer">
                            <label for="soccer">축구</label>
                        </div>
                        <div class="category-checkBox">
                            <input type="checkbox" name="category" id="futsal" value="futsal">
                            <label for="futsal">풋살</label>
                        </div>
                        <div class="category-checkBox">
                            <input type="checkbox" name="category" id="basketball" value="basketball">
                            <label for="basketball">농구</label>
                        </div>
                        <div class="category-checkBox">
                            <input type="checkbox" name="category" id="baseball" value="baseball">
                            <label for="baseball">야구</label>
                        </div>
                    </div>
                </div>
                <div id="soccer-info">
                    <span class="category-name">축구</span><br>
                    <div class="input-wrap">
                        <span class="form-title">포지션</span><br>
                        <select name="soccerPosition" id="soccerPosition">
                            <option disabled hidden ${member.socPosi == null ? 'selected' : ''}>포지션을 선택해 주세요.</option>
						    <option value="LWF" ${member.socPosi == 'LWF' ? 'selected' : ''}>LWF</option>
						    <option value="ST" ${member.socPosi == 'ST' ? 'selected' : ''}>ST</option>
						    <option value="RWF" ${member.socPosi == 'RWF' ? 'selected' : ''}>RWF</option>
						    <option value="LM" ${member.socPosi == 'LM' ? 'selected' : ''}>LM</option>
						    <option value="CM" ${member.socPosi == 'CM' ? 'selected' : ''}>CM</option>
						    <option value="RM" ${member.socPosi == 'RM' ? 'selected' : ''}>RM</option>
						    <option value="LB" ${member.socPosi == 'LB' ? 'selected' : ''}>LB</option>
						    <option value="CB" ${member.socPosi == 'CB' ? 'selected' : ''}>CB</option>
						    <option value="RB" ${member.socPosi == 'RB' ? 'selected' : ''}>RB</option>
						    <option value="GK" ${member.socPosi == 'GK' ? 'selected' : ''}>GK</option>
                        </select>
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">실력 수준</span><br>
                        <select name="soccerSkill" id="soccerSkill">
						    <option disabled hidden ${member.socAbility == null ? 'selected' : ''}>실력 수준을 선택해 주세요.</option>
						    <option value="pro1" ${member.socAbility == 'pro1' ? 'selected' : ''}>프로1</option>
						    <option value="pro2" ${member.socAbility == 'pro2' ? 'selected' : ''}>프로2</option>
						    <option value="pro3" ${member.socAbility == 'pro3' ? 'selected' : ''}>프로3</option>
						    <option value="semiPro1" ${member.socAbility == 'semiPro1' ? 'selected' : ''}>세미프로1</option>
						    <option value="semiPro2" ${member.socAbility == 'semiPro2' ? 'selected' : ''}>세미프로2</option>
						    <option value="semiPro3" ${member.socAbility == 'semiPro3' ? 'selected' : ''}>세미프로3</option>
						    <option value="amateur1" ${member.socAbility == 'amateur1' ? 'selected' : ''}>아마추어1</option>
						    <option value="amateur2" ${member.socAbility == 'amateur2' ? 'selected' : ''}>아마추어2</option>
						    <option value="amateur3" ${member.socAbility == 'amateur3' ? 'selected' : ''}>아마추어3</option>
						    <option value="beginner1" ${member.socAbility == 'beginner1' ? 'selected' : ''}>비기너1</option>
						    <option value="beginner2" ${member.socAbility == 'beginner2' ? 'selected' : ''}>비기너2</option>
						    <option value="beginner3" ${member.socAbility == 'beginner3' ? 'selected' : ''}>비기너3</option>
						</select>
                        <div class="description-skill-wrap">
                            <div>프로 : 고등학교 이상 대학, 프로 선수 실력</div>
                            <div>세미프로 : 일반인 중 에이스, 안정적인 벨런스를 가진 실력</div>
                            <div>아마추어 : 기본기를 어느정도 갖추고 실전 경험을 쌓는 중</div>
                            <div>비기너 : 시작한지 얼마 안돼 서툰 기본기</div>
                        </div>
                    </div>
                    <div class="split-bar"></div>
                </div>
                <div id="futsal-info">
                    <span class="category-name">풋살</span><br>
                    <div class="input-wrap">
                        <span class="form-title">포지션</span><br>
                        <select name="futsalPosition" id="futsalPosition">
                            <option disabled hidden ${member.footPosi == null ? 'selected' : ''}>포지션을 선택해 주세요.</option>
						    <option value="ST" ${member.footPosi == 'ST' ? 'selected' : ''}>ST</option>
						    <option value="DF" ${member.footPosi == 'DF' ? 'selected' : ''}>DF</option>
						    <option value="GK" ${member.footPosi == 'GK' ? 'selected' : ''}>GK</option>
                        </select>
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">실력 수준</span><br>
                        <select name="futsalSkill" id="futsalSkill">
                            <option disabled hidden ${member.footAbility == null ? 'selected' : ''}>실력 수준을 선택해 주세요.</option>
						    <option value="pro1" ${member.footAbility == 'pro1' ? 'selected' : ''}>프로1</option>
						    <option value="pro2" ${member.footAbility == 'pro2' ? 'selected' : ''}>프로2</option>
						    <option value="pro3" ${member.footAbility == 'pro3' ? 'selected' : ''}>프로3</option>
						    <option value="semiPro1" ${member.footAbility == 'semiPro1' ? 'selected' : ''}>세미프로1</option>
						    <option value="semiPro2" ${member.footAbility == 'semiPro2' ? 'selected' : ''}>세미프로2</option>
						    <option value="semiPro3" ${member.footAbility == 'semiPro3' ? 'selected' : ''}>세미프로3</option>
						    <option value="amateur1" ${member.footAbility == 'amateur1' ? 'selected' : ''}>아마추어1</option>
						    <option value="amateur2" ${member.footAbility == 'amateur2' ? 'selected' : ''}>아마추어2</option>
						    <option value="amateur3" ${member.footAbility == 'amateur3' ? 'selected' : ''}>아마추어3</option>
						    <option value="beginner1" ${member.footAbility == 'beginner1' ? 'selected' : ''}>비기너1</option>
						    <option value="beginner2" ${member.footAbility == 'beginner2' ? 'selected' : ''}>비기너2</option>
						    <option value="beginner3" ${member.footAbility == 'beginner3' ? 'selected' : ''}>비기너3</option>
                        </select>
                        <div class="description-skill-wrap">
                            <div>프로 : 고등학교 이상 대학, 프로 선수 실력</div>
                            <div>세미프로 : 일반인 중 에이스, 안정적인 벨런스를 가진 실력</div>
                            <div>아마추어 : 기본기를 어느정도 갖추고 실전 경험을 쌓는 중</div>
                            <div>비기너 : 시작한지 얼마 안돼 서툰 기본기</div>
                        </div>
                    </div>
                    <div class="split-bar"></div>
                </div>

                <div id="basketball-info">
                    <span class="category-name">농구</span><br>
                    <div class="input-wrap">
                        <span class="form-title">포지션</span><br>
                        <select name="basketballPosition" id="basketballPosition">
                            <option disabled hidden ${member.basketPosi == null ? 'selected' : ''}>포지션을 선택해 주세요.</option>
						    <option value="ST" ${member.basketPosi == 'ST' ? 'selected' : ''}>ST</option>
						    <option value="DF" ${member.basketPosi == 'DF' ? 'selected' : ''}>DF</option>
						    <option value="GK" ${member.basketPosi == 'GK' ? 'selected' : ''}>GK</option>
                        </select>
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">실력 수준</span><br>
                        <select name="basketballSkill" id="basketballSkill">
                            <option disabled hidden ${member.basketAbility == null ? 'selected' : ''}>실력 수준을 선택해 주세요.</option>
						    <option value="pro1" ${member.basketAbility == 'pro1' ? 'selected' : ''}>프로1</option>
						    <option value="pro2" ${member.basketAbility == 'pro2' ? 'selected' : ''}>프로2</option>
						    <option value="pro3" ${member.basketAbility == 'pro3' ? 'selected' : ''}>프로3</option>
						    <option value="semiPro1" ${member.basketAbility == 'semiPro1' ? 'selected' : ''}>세미프로1</option>
						    <option value="semiPro2" ${member.basketAbility == 'semiPro2' ? 'selected' : ''}>세미프로2</option>
						    <option value="semiPro3" ${member.basketAbility == 'semiPro3' ? 'selected' : ''}>세미프로3</option>
						    <option value="amateur1" ${member.basketAbility == 'amateur1' ? 'selected' : ''}>아마추어1</option>
						    <option value="amateur2" ${member.basketAbility == 'amateur2' ? 'selected' : ''}>아마추어2</option>
						    <option value="amateur3" ${member.baseAbility == 'amateur3' ? 'selected' : ''}>아마추어3</option>
						    <option value="beginner1" ${member.basketAbility == 'beginner1' ? 'selected' : ''}>비기너1</option>
						    <option value="beginner2" ${member.basketAbility == 'beginner2' ? 'selected' : ''}>비기너2</option>
						    <option value="beginner3" ${member.basketAbility == 'beginner3' ? 'selected' : ''}>비기너3</option>
                        </select>
                        <div class="description-skill-wrap">
                            <div>프로 : 고등학교 이상 대학, 프로 선수 실력</div>
                            <div>세미프로 : 일반인 중 에이스, 안정적인 벨런스를 가진 실력</div>
                            <div>아마추어 : 기본기를 어느정도 갖추고 실전 경험을 쌓는 중</div>
                            <div>비기너 : 시작한지 얼마 안돼 서툰 기본기</div>
                        </div>
                    </div>
                    <div class="split-bar"></div>
                </div>

                <div id="baseball-info">
                    <span class="category-name">야구</span><br>
                    <div class="input-wrap">
                        <span class="form-title">포지션</span><br>
                        <select name="baseballPosition" id="baseballPosition">
                            <option disabled hidden ${member.basePosi == null ? 'selected' : ''}>포지션을 선택해 주세요.</option>
						    <option value="ST" ${member.basePosi == 'ST' ? 'selected' : ''}>ST</option>
						    <option value="DF" ${member.basePosi == 'DF' ? 'selected' : ''}>DF</option>
						    <option value="GK" ${member.basePosi == 'GK' ? 'selected' : ''}>GK</option>
                        </select>
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">실력 수준</span><br>
                        <select name="baseballSkill" id="baseballSkill">
                            <option disabled hidden ${member.baseAbility == null ? 'selected' : ''}>실력 수준을 선택해 주세요.</option>
						    <option value="pro1" ${member.baseAbility == 'pro1' ? 'selected' : ''}>프로1</option>
						    <option value="pro2" ${member.baseAbility == 'pro2' ? 'selected' : ''}>프로2</option>
						    <option value="pro3" ${member.baseAbility == 'pro3' ? 'selected' : ''}>프로3</option>
						    <option value="semiPro1" ${member.baseAbility == 'semiPro1' ? 'selected' : ''}>세미프로1</option>
						    <option value="semiPro2" ${member.baseAbility == 'semiPro2' ? 'selected' : ''}>세미프로2</option>
						    <option value="semiPro3" ${member.baseAbility == 'semiPro3' ? 'selected' : ''}>세미프로3</option>
						    <option value="amateur1" ${member.baseAbility == 'amateur1' ? 'selected' : ''}>아마추어1</option>
						    <option value="amateur2" ${member.baseAbility == 'amateur2' ? 'selected' : ''}>아마추어2</option>
						    <option value="amateur3" ${member.baseAbility == 'amateur3' ? 'selected' : ''}>아마추어3</option>
						    <option value="beginner1" ${member.baseAbility == 'beginner1' ? 'selected' : ''}>비기너1</option>
						    <option value="beginner2" ${member.baseAbility == 'beginner2' ? 'selected' : ''}>비기너2</option>
						    <option value="beginner3" ${member.baseAbility == 'beginner3' ? 'selected' : ''}>비기너3</option>
                        </select>
                        <div class="description-skill-wrap">
                            <div>프로 : 고등학교 이상 대학, 프로 선수 실력</div>
                            <div>세미프로 : 일반인 중 에이스, 안정적인 벨런스를 가진 실력</div>
                            <div>아마추어 : 기본기를 어느정도 갖추고 실전 경험을 쌓는 중</div>
                            <div>비기너 : 시작한지 얼마 안돼 서툰 기본기</div>
                        </div>
                        <div class="split-bar"></div>
                    </div>
                </div>
                <div class="submit-btn">
                	<div id="pwdModiBtns" class="none-clickables" data-bs-toggle="modal" data-bs-target="#pwdModiModal">비밀번호 변경</div>
                    <button type="submit" id="submitBtns" class="none-clickables">수정 완료</button>
                </div>

            </form>
		    <div class="modal fade" id="pwdModiModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 변경</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <form id="pwdModiForm" action="modifyPwd.mp" method="post">
				        <div class="modal-body">
				          <div class="input-wrap">
				            <span class="form-title">기존 비밀번호</span><br>
				            <input type="password" id="memPwd" name="memPwd" placeholder="기존 비밀번호를 입력해주세요.">
				            <span id="checkPwdCondition"></span>
				          </div>
				          <br>
				          <div class="input-wrap">
				            <span class="form-title">기존 비밀번호 확인</span><br>
				            <input type="password" id="pwdCheck" name="pwdCheck" placeholder="비밀번호를 한 번 더 입력해주세요.">
				            <span id="checkPwdResult"></span>
				          </div>
				          <br>
				          <div class="input-wrap">
				            <span class="form-title">변경할 비밀번호</span><br>
				            <input type="password" id="pwdModify" name="pwdModify" placeholder="변경할 비밀번호를 입력해주세요.">
				            <span id="checkPwdRegex"></span>
				          </div>
				          <br>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				          <button type="submit" class="btn btn-primary" id="pwdModiSubmit">비밀번호 변경 완료</button>
				        </div>
				      </form>
				    </div>
				  </div>
				</div>
        </div>
    </div>
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script>
		
	</script>
</body>
</html>