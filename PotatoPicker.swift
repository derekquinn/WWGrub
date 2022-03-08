import SwiftUI

struct PotatoPicker: UIViewControllerRepresentable {

    @Binding var image: UIImage
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(potatoPicker: self)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }

    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

        let potatoPicker: PotatoPicker

        init(potatoPicker: PotatoPicker) {
            self.potatoPicker = potatoPicker
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                let compressedImageData = image.jpegData(compressionQuality: 0.1)!
                potatoPicker.image = UIImage(data: compressedImageData)!
            }
            potatoPicker.presentationMode.wrappedValue.dismiss()
        }
    }
}

