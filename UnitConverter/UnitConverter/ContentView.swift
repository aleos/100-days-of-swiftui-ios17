//
//  ContentView.swift
//  UnitConverter
//
//  Created by Alexander Ostrovsky on 1/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 1.0
    @State private var dimension: Conversion = .volume
    @State private var inputUnit: Dimension = UnitVolume.liters
    @State private var outputUnit: Dimension = UnitVolume.gallons
    @FocusState private var inputIsFocused: Bool
    
    enum Conversion: String, CaseIterable {
        case duration, length, mass, temperature, volume
        
        var units: [Dimension] {
            switch self {
            case .duration:
                [UnitDuration]([.hours, .minutes, .seconds])
            case .length:
                [UnitLength]([.meters, .kilometers, .feet, .yards, .fathoms, .miles])
            case .mass:
                [UnitMass]([.grams, .kilograms, .ounces, .pounds])
            case .temperature:
                [UnitTemperature]([.celsius, .fahrenheit, .kelvin])
            case .volume:
                [UnitVolume]([.milliliters, .liters, .cups, .pints, .gallons])
            }
        }
    }
    
    private var converted: Measurement<Dimension> {
        Measurement(value: input, unit: inputUnit).converted(to: outputUnit)
    }
    
    private static let formatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Value") {
                    TextField("Enter the value", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                }
                
                Section("Units") {
                    Picker("Conversion", selection: $dimension) {
                        ForEach(Conversion.allCases, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    Picker("From", selection: $inputUnit) {
                        ForEach(dimension.units, id: \.self) {
                            Text("\(Self.formatter.string(from: $0))").tag($0)
                        }
                    }
                    Picker("To", selection: $outputUnit) {
                        ForEach(dimension.units, id: \.self) {
                            Text("\(Self.formatter.string(from: $0))").tag($0)
                        }
                    }
                }
                
                Section("Result") {
                    Text("\(converted.formatted(.measurement(width: .abbreviated, usage: .asProvided)))")
                }
            }
            .navigationTitle("UnitConverter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
            .onChange(of: dimension) { _, newValue in
                inputUnit = newValue.units[0]
                outputUnit = newValue.units[1]
            }
        }
    }
}

#Preview {
    ContentView()
}
