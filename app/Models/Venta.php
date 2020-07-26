<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Venta
 * 
 * @property int $idVenta
 * @property int $idUsuario
 * @property int $idMoneda
 * @property int $idTipoTransaccion
 * @property int $idUbicacion
 * @property int $idPersonaCliente
 * @property int $idTipoDocumento
 * @property string $documento
 * @property string $descripcionCliente
 * @property string $direccionCliente
 * @property int $idPersonaVendedor
 * @property float $documentoRelacionado
 * @property string $numeroControl
 * @property float $montoItem
 * @property float $montoImpuesto
 * @property float $gravable
 * @property float $exento
 * @property float $descuento
 * @property float $montoTotal
 * @property string|null $observacion
 * @property Carbon $fechaVenta
 * @property Carbon $fechaOperacion
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Moneda $moneda
 * @property PersonaVendedor $persona_vendedor
 * @property Ubicacion $ubicacion
 * @property Usuario $usuario
 * @property PersonaCliente $persona_cliente
 * @property TipoTransaccion $tipo_transaccion
 * @property Collection|VentaImpuesto[] $venta_impuestos
 * @property Collection|VentaItem[] $venta_items
 *
 * @package App\Models
 */
class Venta extends Model
{
	protected $table = 'venta';
	protected $primaryKey = 'idVenta';
	public $timestamps = false;

	protected $casts = [
		'idUsuario' => 'int',
		'idMoneda' => 'int',
		'idTipoTransaccion' => 'int',
		'idUbicacion' => 'int',
		'idPersonaCliente' => 'int',
		'idTipoDocumento' => 'int',
		'idPersonaVendedor' => 'int',
		'documentoRelacionado' => 'float',
		'montoItem' => 'float',
		'montoImpuesto' => 'float',
		'gravable' => 'float',
		'exento' => 'float',
		'descuento' => 'float',
		'montoTotal' => 'float',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaVenta',
		'fechaOperacion',
		'fechaCreacion'
	];

	protected $fillable = [
		'idUsuario',
		'idMoneda',
		'idTipoTransaccion',
		'idUbicacion',
		'idPersonaCliente',
		'idTipoDocumento',
		'documento',
		'descripcionCliente',
		'direccionCliente',
		'idPersonaVendedor',
		'documentoRelacionado',
		'numeroControl',
		'montoItem',
		'montoImpuesto',
		'gravable',
		'exento',
		'descuento',
		'montoTotal',
		'observacion',
		'fechaVenta',
		'fechaOperacion',
		'fechaCreacion',
		'idEmpresa',
		'estado',
		'activo'
	];

	public function moneda()
	{
		return $this->belongsTo(Moneda::class, 'idMoneda');
	}

	public function persona_vendedor()
	{
		return $this->belongsTo(PersonaVendedor::class, 'idPersonaVendedor');
	}

	public function ubicacion()
	{
		return $this->belongsTo(Ubicacion::class, 'idUbicacion');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'idUsuario');
	}

	public function persona_cliente()
	{
		return $this->belongsTo(PersonaCliente::class, 'idPersonaCliente');
	}

	public function tipo_transaccion()
	{
		return $this->belongsTo(TipoTransaccion::class, 'idTipoTransaccion');
	}

	public function venta_impuestos()
	{
		return $this->hasMany(VentaImpuesto::class, 'idVenta');
	}

	public function venta_items()
	{
		return $this->hasMany(VentaItem::class, 'idVenta');
	}
}
