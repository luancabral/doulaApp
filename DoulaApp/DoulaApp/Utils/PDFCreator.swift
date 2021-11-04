//
//  PDFCreator.swift
//  DoulaApp
//
//  Created by Luan Cabral on 01/11/21.
//

import UIKit
import PDFKit

class PDFCreator{
    let mom:Mom
    let doula:Doula
    let image: UIImage
    
    
    init(mom:Mom, image:UIImage, doula:Doula) {
        self.mom = mom
        self.image = image
        self.doula = doula
    }
    
    
    func createFlyer() -> Data {
        // 1
        let pdfMetaData = [
            kCGPDFContextCreator: "Doula App Builder",
            kCGPDFContextAuthor: "Doula App",
            kCGPDFContextTitle: "Doula APP"
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        // 2
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        // 3
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        // 4
        let data = renderer.pdfData { (context) in
            // 5
            context.beginPage()
            // 6
            let imageBottom = addImage(pageRect: pageRect)
            
            let titleBottom = addTitle(title: "Dados da mãe", pageRect: pageRect, textTop: imageBottom + 18)
            
            let momTitle = addSectionTitle(title: "Dados da Mãe:", pageRect: pageRect, textTop: titleBottom + 18)
            
            let momInfo = addMomInfoText(pageRect: pageRect, textTop: momTitle + 10)
            
            let relativeTitle = addSectionTitle(title: "Parente responsável:", pageRect: pageRect, textTop: momInfo + 18)
            
            let relativeInfo = addRelativeInfo(pageRect: pageRect, textTop: relativeTitle + 10)
            
            let doulaTitle = addSectionTitle(title: "Dados Doula:", pageRect: pageRect, textTop: relativeInfo + 18)
            
            let _  = addDoulaInfo(pageRect: pageRect, textTop: doulaTitle + 10.0)
            
            
            
            
        }
        
        return data
    }
    
    func addTitle(title:String,pageRect: CGRect, textTop: CGFloat) -> CGFloat {
        // 1
        let titleFont = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        // 2
        let titleAttributes: [NSAttributedString.Key: Any] =
        [NSAttributedString.Key.font: titleFont]
        // 3
        let attributedTitle = NSAttributedString(
            string: title,
            attributes: titleAttributes
        )
        // 4
        let titleStringSize = attributedTitle.size()
        // 5
        let titleStringRect = CGRect(
            x: (pageRect.width - titleStringSize.width) / 2.0,
            y: textTop,
            width: titleStringSize.width,
            height: titleStringSize.height
        )
        // 6
        attributedTitle.draw(in: titleStringRect)
        // 7
        return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    func addSectionTitle(title:String,pageRect: CGRect, textTop: CGFloat) -> CGFloat {
        // 1
        let titleFont = UIFont.systemFont(ofSize: 17.0, weight: .bold)
        // 2
        let titleAttributes: [NSAttributedString.Key: Any] =
        [NSAttributedString.Key.font: titleFont]
        // 3
        let attributedTitle = NSAttributedString(
            string: title,
            attributes: titleAttributes
        )
        // 4
        let titleStringSize = attributedTitle.size()
        // 5
        let titleStringRect = CGRect(
            x: 50,
            y: textTop,
            width: titleStringSize.width,
            height: titleStringSize.height
        )
        // 6
        attributedTitle.draw(in: titleStringRect)
        // 7
        return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    
    
    
    func addMomInfoText(pageRect: CGRect, textTop: CGFloat) -> CGFloat {
        let textFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        // 1
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .natural
        paragraphStyle.lineBreakMode = .byWordWrapping
        // 2
        let textAttributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: textFont
            
        ]
        let attributedText = NSAttributedString(
            string: "Nome: \(mom.name ?? "")\nRG: \(mom.rg ?? "")\nCPF: \(mom.cpf ?? "")\nDPP: \(mom.dpp?.toString() ?? "Erro")\nTempo de gestação: \(mom.baby?.weeks ?? "")\nNome do bebê: \(mom.baby?.name ?? "")",
            attributes: textAttributes
        )
        let textStringSize = attributedText.size()
        // 3
        let textRect = CGRect(
            x: 50,
            y: textTop,
            width: textStringSize.width,
            height: textStringSize.height
        )
        attributedText.draw(in: textRect)
        
        return textRect.origin.y + textRect.size.height
    }
    
    
    
    
    func addRelativeInfo(pageRect: CGRect, textTop: CGFloat) -> CGFloat {
        let textFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        // 1
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .natural
        paragraphStyle.lineBreakMode = .byWordWrapping
        // 2
        let textAttributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: textFont
            
        ]
        let attributedText = NSAttributedString(
            string: "Nome: \(mom.people?.name ?? "")\nTelefone: \(mom.people?.phone ?? "")\nParentesco: \(mom.people?.kinship ?? "")",
            attributes: textAttributes
        )
        let textStringSize = attributedText.size()
        // 3
        let textRect = CGRect(
            x: 50,
            y: textTop,
            width: textStringSize.width,
            height: textStringSize.height
        )
        attributedText.draw(in: textRect)
        return textRect.origin.y + textRect.size.height
    }
    
    
    func addDoulaInfo(pageRect: CGRect, textTop: CGFloat) -> CGFloat {
        let textFont = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        // 1
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .natural
        paragraphStyle.lineBreakMode = .byWordWrapping
        // 2
        let textAttributes = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.font: textFont
            
        ]
        let attributedText = NSAttributedString(
            string: "Nome: \(doula.name ?? "")\nTelefone: \(doula.phone ?? "Não informado")\nEmail: \(doula.email ?? "Não informado")",
            attributes: textAttributes
        )
        let textStringSize = attributedText.size()
        // 3
        let textRect = CGRect(
            x: 50,
            y: textTop,
            width: textStringSize.width,
            height: textStringSize.height
        )
        attributedText.draw(in: textRect)
        return textRect.origin.y + textRect.size.height
    }
    
    
    func addImage(pageRect: CGRect) -> CGFloat {
        // 1
        let maxHeight = pageRect.height * 0.15
        let maxWidth = pageRect.width * 0.5
        // 2
        let aspectWidth = maxWidth / image.size.width
        let aspectHeight = maxHeight / image.size.height
        let aspectRatio = min(aspectWidth, aspectHeight)
        // 3
        let scaledWidth = image.size.width * aspectRatio
        let scaledHeight = image.size.height * aspectRatio
        // 4
        let imageX = (pageRect.width - scaledWidth) / 2.0
        let imageRect = CGRect(x: imageX, y: 36,
                               width: scaledWidth, height: scaledHeight)
        // 5
        image.draw(in: imageRect)
        return imageRect.origin.y + imageRect.size.height
    }
    
    
    
}
