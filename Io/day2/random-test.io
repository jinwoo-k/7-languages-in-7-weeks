
diffMessage := method(answer, input,
	if(answer > input, "정답보다 작습니다.", "정답보다 큽니다.")
)

falseMessage := method(remainChance, answer, input,
	 diffMessage(answer, input) .. " 남은기회는 " .. remainChance .. "입니다."
)

trueMessage := "정답입니다! 축하합니다."

failMessage := method(answer,
	"시도 횟수 초과로 종료합니다. 정답은 " .. answer .. "입니다."
)

check := method(remainChance, answer,
	(remainChance <= 0) ifTrue(failMessage(answer) println; return)

	"input : " print
	in := File standardInput readLine asNumber

	if (in == answer, trueMessage println, falseMessage(remainChance - 1, answer, in) println; check(remainChance - 1, answer))
)

randomValue := Random value(100 + 1) floor

"1애서 100까지의 수중 랜덤하게 한개의 숫자가 선택됐습니다. 그 수를 맞춰보세요. 총 도전 기회는 10회 입니다." println
check(10, randomValue)