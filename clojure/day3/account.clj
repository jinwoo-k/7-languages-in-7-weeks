;q1. 참조를 이용해서 계좌를 담은 백터를 메모리 위에 생성하라. 계좌의 잔액을 수정하기 위해 사용할 입금과 출금 함수를 정의하라.

(def accounts (ref [0 0 0 0 0]))

(defn balance [id]
	(nth @accounts id))

(defn credit [id amount]
	(dosync
		(alter accounts assoc id (+ (balance id) amount))))

(defn debit [id amount]
	(credit id (- amount)))