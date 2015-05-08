# WebPDemo

This is a small demo project that uses WebP to encode and decode images. 
Use the Browse button to browse through a collection of the photos on your phone. 
Select a photo to encode, the original photo is then downsampled to 128x128, encoeded with WebP, assigned a file name, and added to a tableview.
Select an entry in the tableview and the photo will be decoded and shown in a UIImageView
PhotoKit is used to fetch the photos from your phone.

All parts of the WebP part of this were obtained from an opensource project at 
github.com/shmidt/WebP-UIImage
