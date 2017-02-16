;q1. 매크로를 사용하는 조건과 함께 unless를 구현하라

(defmacro unless [test body else]
	(list 'if (list 'not test) body else))

; test q1
(unless true (println "it's true") (println "it's false"))
(unless false (println "it's true") (println "it's false"))




;q2. 프로토콜을 구현하는 자료형을 defrecord 를 이용해서 작성하라. (인터넷 예제 사용함)

(defprotocol Performer 
  "Performers come in all forms"
  (perform [this] "Perform your talent")
  (demand  [this] "Make a demand")
  (act-out [this] "Act out in dramatic fashion")
)

(defrecord RealityStar []
  Performer
  (perform [_] (println "I already am!"))
  (demand  [_] (println "I demand you keep me on this show"))
  (act-out [_] (println "Gonna hoard all the tp in this house!"))
  )

(defrecord RockStar []
  Performer
  (perform [_] (println "Party like a rock—Party like a rockstar!"))
  (demand  [_] (println "Bring me an empanada from that old Columbian lady in Staten Island. You know who i mean"))
  (act-out [_] (println "I'm shutting down the studio!"))
  )
  
;usage

;create values of the two record types
(def tyree (RealityStar. ))
(def tron (RockStar. ))

;call functions with the values. The correct implementation will be selected based on type
(demand tyree)
(demand tron)

(act-out tyree)
(act-out tron)