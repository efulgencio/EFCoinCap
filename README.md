# EFCoinCap
About CoinCap API 2.0.  (SwiftUI / Combine / MVMV) View / Domain / Data (UseCase / Repository) 

Description
---

**This project contains two features LIST and DETAIL.**

The LIST differs from the DETAIL by the characteristic that uses a DTO in the flow that goes from:

 VIEW -> VIEWMODEL -> USE CASE -> REPOSITORY 

And returns

 REPOSITORY -> USE CASE -> MAPPER -> VIEWMODEL -> VIEW 
 
 Along the same path to the initial VIEW passing through a MAPPER that modifies the value of the response to an ideal format for the VIEWMODEL.


Feature LIST folder structure
---

**The goal is to call: api.coincap.io/v2/assets and show the list of assets in the view.**

| Folder | SubFolder  | File | Description|
|--------------|--------------|--------------|--------------|
| List | | | |
|  | View | |  |
|  | | ListView  | Views components |
|  | | ListModel | Data for feed view |
|  | Domain | |  |
|  | | ListCaseUse  | Define method: getAssets: () -> AnyPublisher<Assets, NetworkError> |
|  | | ListCaseLive | Implement getAssets. Comunicate with Repository Live |
|  | | ListCaseMock | Implement getAssets. Comunicate with Repository Mock |
|  | Data | |  |
|  | | ListRepository  | Define method: getAssets: () -> AnyPublisher<AssetsDTO, NetworkError> |
|  | | ListRepositoryLive | Call  -> CombineManager.shared.getData(endpoint: EndPointGrupo.enumAsset(.assets), type: AssetsDTO.self) (Return response after internet API request) |
|  | | ListRepositoryMock | Call -> try! JSONDecoder().decode(AssetsDTO.self, from: jsonAssets)  (Return MOCK AssetsDTO) |


###### In the next few days I will update information.

<!-- Este es un bloque comentado

| Encabezado 1 | Encabezado 2 | Encabezado 3 |
|--------------|--------------|--------------|
| Valor 1      | Valor 2      | Valor 3      |
| Valor 4      | Valor 5      | Valor 6      |

# Título de nivel 1
## Título de nivel 2
### Título de nivel 3
#### Título de nivel 4
##### Título de nivel 5
###### Título de nivel 6

**Negrita**
*Cursiva*
***Negrita y Cursiva***

 -->
