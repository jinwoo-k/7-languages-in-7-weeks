
import scala.io._
import scala.actors._
import Actor._

import scala.actors.scheduler.ResizableThreadPoolScheduler
Scheduler.impl = {
	val s = new ResizableThreadPoolScheduler(false);
	s.start()
	s
}


object PageLoader {
	def getPageSize(url: String) = Source.fromURL(url).mkString.length

}

val urls = List("http://www.naver.com/",
	"https://twitter.com/",
	"http://www.daum.net/",
	"http://www.cnn.com/")

def timeMethd(method: () => Unit) = {
	val start = System.nanoTime
	method()
	val end = System.nanoTime
	println("Method took " + (end - start) / 1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
	for (url <- urls) {
		println("size for " + url + " : " + PageLoader.getPageSize(url))
	}
	for (url <- urls) {
		println("size for " + url + " : " + PageLoader.getPageSize(url))
	}
	for (url <- urls) {
		println("size for " + url + " : " + PageLoader.getPageSize(url))
	}
}

def getPageSizeConcurrently() = {
	val caller = self

	for(url <- urls) {
		actor { caller ! (url, PageLoader.getPageSize(url)) }
	}
	for(url <- urls) {
		actor { caller ! (url, PageLoader.getPageSize(url)) }
	}
	for(url <- urls) {
		actor { caller ! (url, PageLoader.getPageSize(url)) }
	}

	for(i <- 1 to urls.size * 3) {
		receive {
			case (url, size) =>
				println("size for " + url + " : " + size)
		}
	}
}

println("sequentially run:")
timeMethd(getPageSizeSequentially)
println
println("concurrently run:")
timeMethd(getPageSizeConcurrently)


