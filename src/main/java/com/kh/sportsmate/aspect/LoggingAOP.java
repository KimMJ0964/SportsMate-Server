package com.kh.sportsmate.aspect;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.util.Arrays;
/**
 * packageName    : com.kh.sportsmate.aspect
 * fileName       : LoggingAOP
 * author         : jun
 * date           : 2024. 11. 1.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 1.        jun       최초 생성
 */
/*
 * - @Slf4j : Lombok에 있는것으로 로그를 찍어주는 함수를 가져와준다.
 * - @Aspect : 해당 클래스가 Aspect(AOP 객체)라는 것을 선언
 * - @Component : Spring이 해당 빈을 서칭할 수 있도록 선언(Bean 등록)
 * */
@Slf4j
@Aspect
@Component
public class LoggingAOP {

    /*
     * < 시점 >
     * @Before           : 대상메서드 실행전에 Advice(추가기능 현재는 로그)이 실행된다.
     * @After            : 대상메서드 실행 후에 Advice(추가기능 현재는 로그)이 실행된다.
     * @AfterReturning   : 대상 메서드가 정상적으로 반환된 후에 Advice(추가기능)이 실행된다.
     * @AfterThrowing    : 대상 메서드가 예외를 던진 후에 Advice(추가기능)이 실행된다.
     * @Around           : 대상 메서드를 감싸서 호출 전/후에 Advice(추가기능)이 실행된다.
     * */

    /*
     * < 대상 지정 >
     * target        : 특정 인터페이스와 그 자식 클래스
     * within        : 특정 패키지 또는 클래스
     * execution     : 표현식으로 형태 지정
     * */

    // 특정 메서드나 패키지등의 join point
//    @Pointcut("excution(* com.kh..*.*(..))") // com.kh 안에 모든 controller패키지 하위 클래스의 모든 객체, 모든 메서드에 적용하겠다고 지점 설정
    @Pointcut("execution(* com.kh.sportsmate..controller.*.*(..))") // execution(* 패키지fullname.클래스.메서드(파라미터))
    private void cut() {};

    // cut 메서드가 실행되는 지점 이전에 before()메서드를 실행
    // JoinPoint : pointcut 지점에 대한 정보가 들어있다.
    // 메서드의 실행이 가장 일반적인 joinPoint이다.
    @Before(value = "cut()")
    public void before(JoinPoint joinPoint){
        // 실행되는 메서드의 이름을 가져오기
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();

        // 매개변수 정보 가져오기
        Object[] args = joinPoint.getArgs();

        log.info("================================= START =================================");
        log.info("--------------------------------- API Controller ---------------------------------");
        log.info("Information           :   " + methodSignature); // toString 메서드 자동으로 실행된다.
        log.info("Method Name           :   " + method);
        log.info("Parameter             :   " + Arrays.toString(args));
    }
    @AfterReturning(value = "cut()",returning = "obj")
    public void AfterReturn(JoinPoint joinPoint, Object obj){
        log.info("================================= END =================================");
        log.info("Object            :   " + obj);
    }

    // api 시간 측정
    @Around(value = "cut()")
    public Object displayLogInfo(ProceedingJoinPoint joinPoint) throws Throwable {
        // 실행 전 서버 시간
        long start = System.currentTimeMillis(); // 0

        // 실행하려던 joinPoin메서드 실행
        Object result = joinPoint.proceed(); // 원래 진행중이던 작업 진행

        long end = System.currentTimeMillis(); // 끝나는 시간

        long runTime = end - start; // 총 실행시간

        log.info("--------------------------------- API 실행시간 ---------------------------------");
        log.info("Information           :   " + joinPoint.getSignature());
        log.info("총 실행 시간           :   " + runTime + "ms");

        return result;
    }


}
