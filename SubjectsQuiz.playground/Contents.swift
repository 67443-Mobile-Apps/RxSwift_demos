import RxSwift
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


example(of: "PublishSubject") {

  let subject = PublishSubject<String>()
  subject.onNext("Is anyone listening?")

  let subscriptionOne = subject
    .subscribe(onNext: { string in
      print("subscription 1)", string)
    })

  subject.on(.next("1"))
  subject.onNext("2")

  let subscriptionTwo = subject
    .subscribe { event in
      print("subscription 2)", event.element ?? event)
  }

  subject.onNext("3")

  subscriptionOne.dispose()

  subject.onNext("4")

  subject.onCompleted()

  subscriptionTwo.dispose()

  let disposeBag = DisposeBag()

  subject
    .subscribe {
      print("subscription 3)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)

  subject.onNext("?")
}
sectionBreak()






example(of: "BehaviorSubject") {

  let subject = BehaviorSubject(value: "Initial value")

  subject.onNext("Is anyone listening?")

  let subscriptionOne = subject
    .subscribe(onNext: { string in
      print("subscription 1)", string)
    })

  subject.on(.next("1"))
  subject.onNext("2")

  let subscriptionTwo = subject
    .subscribe { event in
      print("subscription 2)", event.element ?? event)
  }

  subject.onNext("3")

  subscriptionOne.dispose()

  subject.onNext("4")

  subject.onCompleted()

  subscriptionTwo.dispose()

  let disposeBag = DisposeBag()

  subject
    .subscribe {
      print("subscription 3)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)
}
sectionBreak()






example(of: "ReplaySubject") {

  let subject = ReplaySubject<String>.create(bufferSize: 2)

  subject.onNext("Is anyone listening?")

  let subscriptionOne = subject
    .subscribe(onNext: { string in
      print("subscription 1)", string)
    })

  subject.on(.next("1"))
  subject.onNext("2")

  let subscriptionTwo = subject
    .subscribe { event in
      print("subscription 2)", event.element ?? event)
  }

  subject.onNext("3")

  subscriptionOne.dispose()

  subject.onNext("4")

  subject.onCompleted()

  subscriptionTwo.dispose()

  let disposeBag = DisposeBag()

  subject
    .subscribe {
      print("subscription 3)", $0.element ?? $0)
    }
    .disposed(by: disposeBag)
}
sectionBreak()
//
