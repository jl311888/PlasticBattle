import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // test

//    // working function without image
//    router.get("station", "update") { req -> Future<Station> in
//        guard
//            let url = req.query[String.self, at: "sht"] else {
//                throw Abort(.badRequest)
//        }
//
//
//        let headers = HTTPHeaders([("Content-Type", "application/json")])
//        return try req.client().get(url, headers: headers)
//            .flatMap(to: Sheet.self) { response -> Future<Sheet> in
//                return try response.content.decode(Sheet.self)
//
//            }.flatMap(to: Station.self) { sheet -> Future<Station> in
//                var stationArray = [Future<Station>]()
//                for ent in sheet.feed.entry {
//                    let headers = HTTPHeaders([("Content-Type", "application/json")])
//                    let name = ent.gsx$name["$t"]!
//                    let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
//                    let url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=\(encodedName)&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyC22qAexcM9mtXonVcgza3sqmAZgqsWSXI"
//                    print(url)
//                    let googleReq = try req.client().get(url, headers: headers)
//                        .flatMap(to: GooglePlace.self) { googleResponse -> Future<GooglePlace> in
//                            return try googleResponse.content.decode(GooglePlace.self)
//                        }.flatMap(to: Station.self) { googlePlace -> Future<Station> in
//                            let name = ent.gsx$name["$t"]!
//                            let businessType = ent.gsx$businesstype["$t"]!
//                            let cost = ent.gsx$cost["$t"]!
//                            let rate = ent.gsx$rate["$t"]!
//                            let address = ent.gsx$address["$t"]!
//                            let lat = googlePlace.candidates[0].geometry.location.lat
//                            let lng = googlePlace.candidates[0].geometry.location.lng
//                            let photoReference = googlePlace.candidates[0].photos[0].photo_reference
//                            print(photoReference)
//
//                            let station = Station(name: name, businessType: businessType, cost: cost, rate: rate, address: address, lat: lat, lng: lng, photoReference: photoReference)
//
//                            return station.save(on: req)
//
//                    }
//                    stationArray.append(googleReq)
//
//                }
//                return stationArray[0]
//        }
//    }
    
//    // Working setting photoref to html photo link
//    router.get("station") { req -> Future<[Station]> in
//        return Station.query(on: req).all()
//    }
//
//    router.get("station", "update") { req -> Future<Station> in
//        guard
//            let url = req.query[String.self, at: "sht"] else {
//                throw Abort(.badRequest)
//        }
//
//
//        let headers = HTTPHeaders([("Content-Type", "application/json")])
//        return try req.client().get(url, headers: headers)
//            .flatMap(to: Sheet.self) { response -> Future<Sheet> in
//                return try response.content.decode(Sheet.self)
//
//            }.flatMap(to: Station.self) { sheet -> Future<Station> in
//                var stationArray = [Future<Station>]()
//                for ent in sheet.feed.entry {
//                    let headers = HTTPHeaders([("Content-Type", "application/json")])
//                    let name = ent.gsx$name["$t"]!
//                    let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
//                    let url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=\(encodedName)&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyACbE7_nskgmeIyTI1-p3YNo0CLVURNhY4"
//                    print(url)
//                    let googleReq = try req.client().get(url, headers: headers)
//                        .flatMap(to: GooglePlace.self) { googleResponse -> Future<GooglePlace> in
//                            return try googleResponse.content.decode(GooglePlace.self)
//                        }.flatMap(to: Station.self) { googlePlace -> Future<Station> in
//                            let name = ent.gsx$name["$t"]!
//                            let businessType = ent.gsx$businesstype["$t"]!
//                            let cost = ent.gsx$cost["$t"]!
//                            let rate = ent.gsx$rate["$t"]!
//                            let address = ent.gsx$address["$t"]!
//                            let lat = googlePlace.candidates[0].geometry.location.lat
//                            let lng = googlePlace.candidates[0].geometry.location.lng
//
//                            let photoRef = googlePlace.candidates[0].photos[0].photo_reference
//
//                            let urlString = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=500&photoreference=\(photoRef)&key=AIzaSyACbE7_nskgmeIyTI1-p3YNo0CLVURNhY4"
//
//                            let photoReference = urlString
//                            //let photo = getPhotoStringfrom(imageRef: photoReference)!
//
//
//                            let station = Station(name: name, businessType: businessType, cost: cost, rate: rate, address: address, lat: lat, lng: lng, photoReference: photoReference)
//
//                            return station.save(on: req)
//
//                    }
//                    stationArray.append(googleReq)
//
//                }
//                return stationArray[0]
//        }
//    }
    
    router.get("station") { req -> Future<[Station]> in
        return Station.query(on: req).all()
    }
    
    router.get("station", "update") { req -> Future<Station> in
        guard
            let url = req.query[String.self, at: "sht"] else {
                throw Abort(.badRequest)
        }
        
        
        let headers = HTTPHeaders([("Content-Type", "application/json")])
        return try req.client().get(url, headers: headers)
            .flatMap(to: Sheet.self) { response -> Future<Sheet> in
                return try response.content.decode(Sheet.self)
                
            }.flatMap(to: Station.self) { sheet -> Future<Station> in
                var stationArray = [Future<Station>]()
                for ent in sheet.feed.entry {
                    let headers = HTTPHeaders([("Content-Type", "application/json")])
                    let name = ent.gsx$name["$t"]!
                    let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
                    let url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=\(encodedName)&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyACbE7_nskgmeIyTI1-p3YNo0CLVURNhY4"
                    print(url)
                    let googleReq = try req.client().get(url, headers: headers)
                        .flatMap(to: GooglePlace.self) { googleResponse -> Future<GooglePlace> in
                            return try googleResponse.content.decode(GooglePlace.self)
                        }.flatMap(to: Station.self) { googlePlace -> Future<Station> in
                            let name = ent.gsx$name["$t"]!
                            let businessType = ent.gsx$businesstype["$t"]!
                            let cost = ent.gsx$cost["$t"]!
                            let rate = ent.gsx$rate["$t"]!
                            let address = ent.gsx$address["$t"]!
                            let lat = googlePlace.candidates[0].geometry.location.lat
                            let lng = googlePlace.candidates[0].geometry.location.lng
                            
                            let photoRef = googlePlace.candidates[0].photos[0].photo_reference
                            
                            let urlString = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=500&photoreference=\(photoRef)&key=AIzaSyACbE7_nskgmeIyTI1-p3YNo0CLVURNhY4"
                            
                            let photoReference = urlString //getPhotoStringfrom(imageRef: photoRef)
                            //let photo = getPhotoStringfrom(imageRef: photoReference)!
                            
                            
                            let station = Station(name: name, businessType: businessType, cost: cost, rate: rate, address: address, lat: lat, lng: lng, photoReference: photoReference, b64Photo: "")
                            
                            return station.save(on: req)
                            
                    }
                    stationArray.append(googleReq)
                    
                }
                return stationArray[0]
        }
    }
    
    router.put("update", Station.parameter) {
        req -> Future<Station> in
        return try flatMap(to: Station.self, req.parameters.next(Station.self), req.content.decode(Station.self)) {
            station, updatedStation in
            station.name = updatedStation.name
            station.businessType = updatedStation.businessType
            station.cost = updatedStation.cost
            station.rate = updatedStation.rate
            station.address = updatedStation.address
            station.lat = updatedStation.lat
            station.lng = updatedStation.lng
            station.photoReference = updatedStation.photoReference
            station.b64Photo = updatedStation.b64Photo
            
            return station.save(on: req)
        }
    }
    
    router.get("get", "image") { req -> String in

        guard
            let url1 = req.query[String.self, at: "img"] else {
                throw Abort(.badRequest)
        }
        //let urlString = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=500&photoreference=CmRaAAAAiJr0PAUgBpv576XcLWm3nyswCsISX0h9oa0zZpLVw1ONPFAALg4yOye1Vkd8CAYS1vhmb9aFDTggjFWe5ro5v1hdtkhvXQwNEPyrvxQzQbzual46oA15_Cvy4ywgVG9aEhAOgaBdvYD5t31ZbpXSdOT2GhSsiqY0k6_B7nBHp6J2MMUUwh7iHA&key=AIzaSyC22qAexcM9mtXonVcgza3sqmAZgqsWSXI"
        //let headers = HTTPHeaders([("Content-Type", "application/json")])
        
        let urlString = "https://cdnimages.familyhomeplans.com/plans/59952/59952-b600.jpg"
        let url = URL(string: urlString)
            //return "failed to create url"
            
            //return Future( //Response(http: HTTPResponse(status: .notFound), using: req)
        //}
        
        let anotherreq = try req.client().get(url!)
            .flatMap(to: JpegImg.self) { response -> Future<JpegImg> in
                let img = try response.content.decode(JpegImg.self)
                print(img)
                return img
                
            }.map { response in
                print(response.body)
        }
        
        return ""
        
//        return try req.client().get(url!)
//            .map(to: HTTPMessage.self) { googleResponse in
//                googleRespon
//                let base64 = imageData.base64EncodedString()
//                print(base64)
//                return base64
//        }
        
//        var base64 = "empty"
//        try DispatchQueue.global().sync {
//            let imageData = try Data(contentsOf: url)
//            base64 = imageData.base64EncodedString()
//            print(base64)
//        }
//
//
//        return String(base64.count)
        //return base64//Response(http: HTTPResponse(status: .ok), using: req)
    }

    router.delete("station") { req -> Future<Response> in
        return try resetData(req: req)
    }

    func resetData(req: Request) throws -> Future<Response> {
        return Station.query(on: req).delete().map(to: Response.self) {
            return Response(http: HTTPResponse(status: .ok), using: req)
        }
    }
    
    func getPhotoStringfrom(imageRef: String) -> String {
        let urlString = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=500&photoreference=\(imageRef)&key=AIzaSyACbE7_nskgmeIyTI1-p3YNo0CLVURNhY4"
        guard let url = URL(string: urlString) else {
            return "failed to create url"
            
        }
        var imageData: Data?
        var base64: String?
        do {
            imageData = try Data(contentsOf: url)
            base64 = imageData!.base64EncodedString()
        } catch {
            return "image data load failed"
        }
        
        //print(base64)
        if base64 == "" {
            return "empty"
        }
        return base64!
        
    }
}
