# ViewCodeExample
Projeto básico criado para aprender e testar o ViewCode e suas boas práticas

## Configurações Iniciais

Essas configurações iniciais devem ser feitas em seus projetos para que seja possível utilizar o ViewCode

- Arquivo principal do projeto > General > Main Interface -> Deixar o campo vazio (retirar o "Main")
- Deletar o arquivo de Storyboard
- No caso do projeto ter um SceneDelegate, inserir o seguinte código no arquivo: 

```swift
guard let scene = (scene as? UIWindowScene) else { return }
window = UIWindow(windowScene: scene)
window?.rootViewController = ViewController()
window?.makeKeyAndVisible()
```
- Caso seja o projeto utilize apenas AppDelegate, inserir o seguinte código:

```swift
let window = UIWindow(frame: UIScreen.main.bounds) 
window?.rootViewController = ViewController()
self.window = window
window?.makeKeyAndVisible()	
```

- No Info.plist retirar a Key Application Scene Manifest > Scene Configuration > Application Session Role> Item 0 > **Storyboard Name**
