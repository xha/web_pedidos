<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Compra
 * 
 * @property int $idCompra
 * @property int $idUsuario
 * @property int $idMoneda
 * @property int $idUbicacion
 * @property int $idTipoTransaccion
 * @property int $idPersonaProveedor
 * @property string $documento
 * @property float $montoItem
 * @property float $montoImpuesto
 * @property float $gravable
 * @property float $exento
 * @property float $descuento
 * @property float $montoRetencion
 * @property float $montoTotal
 * @property string|null $observacion
 * @property Carbon $fechaCompra
 * @property Carbon $fechaOperacion
 * @property Carbon $fechaCreacion
 * @property int $idEmpresa
 * @property bool $estado
 * @property bool $activo
 * 
 * @property Moneda $moneda
 * @property Ubicacion $ubicacion
 * @property Usuario $usuario
 * @property PersonaProveedor $persona_proveedor
 * @property TipoTransaccion $tipo_transaccion
 * @property Collection|Impuesto[] $impuestos
 * @property Collection|Item[] $items
 *
 * @package App\Models
 */
class Compra extends Model
{
	protected $table = 'compra';
	protected $primaryKey = 'idCompra';
	public $timestamps = false;

	protected $casts = [
		'idUsuario' => 'int',
		'idMoneda' => 'int',
		'idUbicacion' => 'int',
		'idTipoTransaccion' => 'int',
		'idPersonaProveedor' => 'int',
		'montoItem' => 'float',
		'montoImpuesto' => 'float',
		'gravable' => 'float',
		'exento' => 'float',
		'descuento' => 'float',
		'montoRetencion' => 'float',
		'montoTotal' => 'float',
		'idEmpresa' => 'int',
		'estado' => 'bool',
		'activo' => 'bool'
	];

	protected $dates = [
		'fechaCompra',
		'fechaOperacion',
		'fechaCreacion'
	];

	protected $fillable = [
		'idUsuario',
		'idMoneda',
		'idUbicacion',
		'idTipoTransaccion',
		'idPersonaProveedor',
		'documento',
		'montoItem',
		'montoImpuesto',
		'gravable',
		'exento',
		'descuento',
		'montoRetencion',
		'montoTotal',
		'observacion',
		'fechaCompra',
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

	public function ubicacion()
	{
		return $this->belongsTo(Ubicacion::class, 'idUbicacion');
	}

	public function usuario()
	{
		return $this->belongsTo(Usuario::class, 'idUsuario');
	}

	public function persona_proveedor()
	{
		return $this->belongsTo(PersonaProveedor::class, 'idPersonaProveedor');
	}

	public function tipo_transaccion()
	{
		return $this->belongsTo(TipoTransaccion::class, 'idTipoTransaccion');
	}

	public function impuestos()
	{
		return $this->belongsToMany(Impuesto::class, 'compra_impuesto', 'idCompra', 'idImpuesto')
					->withPivot('idCompraImpuesto', 'monto', 'montoTasa', 'montoTotal', 'fechaCreacion', 'idEmpresa', 'estado', 'activo');
	}

	public function items()
	{
		return $this->belongsToMany(Item::class, 'compra_item', 'idCompra', 'idItem')
					->withPivot('idCompraItem', 'numeroLinea', 'descripcionItem', 'cantidad', 'costo', 'precio', 'impuesto', 'descuento', 'montoTotal', 'esExento', 'fechaCreacion', 'idEmpresa', 'estado', 'activo');
	}
}
