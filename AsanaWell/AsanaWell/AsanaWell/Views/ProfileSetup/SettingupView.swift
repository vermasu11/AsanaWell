import SwiftUI

struct SettingupView: View {
    @State private var age: Double = 30
    @State private var sexAtBirth: String = "Male"
    @State private var selectedLimitationIndex = 0
    @State private var selectedMentalHealthIndex = 0
    @State private var selectedWeightIndex = 0
    @State private var isHealthGoalsViewPresented = false
    
    private let sexOptions = ["Male", "Female", "Other"]
    private let limitationOptions = ["None", "Back Pain", "Arthritis", "Knee Pain"]
    private let mentalHealthOptions = ["None", "Stress", "Anxiety", "Depression"]
    private let weightOptions = ["Normal", "Obese", "Overweight", "Underweight"]
    
    var body: some View {
        ZStack {
            
            Image("backgroundAsanaWell")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
            
            ScrollView {
                VStack() {
                        
                    Picker(selection: $sexAtBirth, label: Text("Sex at Birth").frame(maxWidth: .infinity, alignment: .center)) {
                        ForEach(sexOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    AgeSelectorView(age: $age)
                    
                    
                    OptionSelectorView(title: "Physical Health Status", options: limitationOptions, selectedIndex: $selectedLimitationIndex)
                    OptionSelectorView(title: "Mental Health Status", options: mentalHealthOptions, selectedIndex: $selectedMentalHealthIndex)
                    OptionSelectorView(title: "Body Type", options: weightOptions, selectedIndex: $selectedWeightIndex)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                        
                }
                .padding()
                .frame(width: 380)
                
                VStack{
                    NavigationLink(destination: GoalSelectionView(),
                        label: {
                            Text("Select Health Goal")
                            .font(.title3)
                                .foregroundColor(.white)
                                .frame( maxWidth: 165)
                                .padding()
                                .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.green.opacity(0.8)]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(30)
                    })
                    
                }
                Spacer()
                
               
            }
            .frame(width: 380)
        }
        
    }
}

struct AgeSelectorView: View {
    @Binding var age: Double
    
    var body: some View {
        VStack {
            Text("Age: \(Int(age))")
                .fontWeight(.bold)
            Slider(value: $age, in: 16...100, step: 1)
                .accentColor(.green)
        }
        .padding()
        .padding(.horizontal, 20)
    }
}

struct OptionSelectorView: View {
    let title: String
    let options: [String]
    @Binding var selectedIndex: Int
    
    let columns: [GridItem] =
            Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.horizontal, 20)
            
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(options.indices, id: \.self) { index in
                        OptionCard(title: options[index], isSelected: index == selectedIndex)
                            .onTapGesture {
                                withAnimation {
                                    selectedIndex = index
                                }
                            }
                    }
                }
                .frame(height: 115, alignment: .center)

            }
            .frame(width: 340)
        }
        .padding()
    }
}

struct OptionCard: View {
    let title: String
    var isSelected: Bool
    
    var body: some View {
        Text(title)
            .padding()
            .background(isSelected ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.blue, lineWidth: isSelected ? 2 : 0)
            )
            .frame(maxWidth: 300)
            .animation(.easeOut, value: isSelected)
    }
}



struct FilledButton: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.green]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

// Preview Providers
struct SettingupView_Previews: PreviewProvider {
    static var previews: some View {
        SettingupView()
            
    }
}
