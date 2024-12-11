function kdis --wraps='export KUBECTL=""' --wraps='export KUBECONFIG=""' --description 'alias kdis=export KUBECONFIG=""'
  export KUBECONFIG="" $argv
        
end
