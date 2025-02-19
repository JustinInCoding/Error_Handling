// Copyright (c) 2019 Razeware LLC
// See Copyright Notice page for details about the license.

enum MathError: Error {
	case divisionError
}

func divide(_ numerator: Double, _ denominator: Double) throws -> Double {
	if abs(denominator) < Double.ulpOfOne {
		throw MathError.divisionError
	}
  return numerator / denominator
}

do {
	print(try divide(10, 0))
} catch {
	dump(error)
}

////////////////////////////////////////////////////////////////////////////

let isWeekend = true
let value = isWeekend ? 10 : 0

@inlinable
public func ifelse<T>(_ test: Bool,
                      _ a: @autoclosure () throws -> T,
                      _ b: @autoclosure () throws ->T) rethrows -> T {
  
  return test ? try a() : try b()
}

func expensive() throws -> String {
  print("I am very expensive")
  return "Boo"
}

let value1 = try? ifelse(isWeekend, "Yay", try expensive())
let value2 = ifelse(isWeekend, "Yay", "Boo")
