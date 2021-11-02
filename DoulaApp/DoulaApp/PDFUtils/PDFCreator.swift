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
    let title: String
    let image: UIImage


    init(title: String, mom:Mom, image:UIImage) {
        self.title = title
        self.mom = mom
        self.image = image
  }

  
  func createFlyer() -> Data {
    // 1
    let pdfMetaData = [
      kCGPDFContextCreator: "Doula App Builder",
      kCGPDFContextAuthor: "Doula App",
      kCGPDFContextTitle: title
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
        let titleBottom = addTitle(pageRect: pageRect, textTop: imageBottom + 18)
      
      let momInfo = addMomInfoText(pageRect: pageRect, textTop: titleBottom + 18.0)
        
      let relativeInfo = addRelativeInfo(pageRect: pageRect, textTop: momInfo + 18.0)


      
    }

    return data
  }

  func addTitle(pageRect: CGRect, textTop: CGFloat) -> CGFloat {
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
  
  
  func addMomInfoText(pageRect: CGRect, textTop: CGFloat) -> CGFloat {
      let textFont = UIFont.boldSystemFont(ofSize: 15.0)
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
        string: "Nome: \(mom.name ?? "")\nRG:\(mom.rg ?? "")\nCPF:\(mom.cpf ?? "")\nDPP:\(mom.dpp ?? Date())\nTempo de gestação: \(mom.baby?.weeks ?? "")",
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
        let textFont = UIFont.boldSystemFont(ofSize: 15.0)
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
        string: "Nome: \(mom.people?.name ?? "")\nTelefone:\(mom.people?.phone ?? "")\nParentesco:\(mom.people?.kinship ?? "")",
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
